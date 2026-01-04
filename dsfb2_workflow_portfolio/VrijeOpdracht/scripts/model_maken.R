
# =============================
# 0️⃣ Packages laden
# =============================
library(tidyverse)
library(magick)
library(tidymodels)

set.seed(123)

# =============================
# 1️⃣ Functie: frame features extraheren
# =============================
extract_frame_features <- function(img_path) {
  img <- image_read(img_path) %>%
    image_convert(colorspace = "gray")
  
  mat <- as.numeric(image_data(img))
  
  tibble(
    mean_intensity = mean(mat),
    sd_intensity   = sd(mat),
    max_intensity  = max(mat)
  )
}


# =============================
# 3️⃣ Frames → video-level features
# =============================
video_features <- video_dataset %>%
  mutate(
    frame_features = map(frames, ~ map_dfr(.x, extract_frame_features))
  ) %>%
  mutate(
    video_features = map(frame_features, ~ summarise(
      .x,
      mean_intensity_mean = mean(mean_intensity),
      mean_intensity_sd   = sd(mean_intensity),
      sd_intensity_mean   = mean(sd_intensity)
      # max_intensity constant = weghalen
    ))
  ) %>%
  select(video_id, label, video_features) %>%
  unnest(video_features) %>%
  mutate(label = factor(label))  # factor voor classificatie

# Check: één rij per video
stopifnot(nrow(video_features) == length(unique(video_features$video_id)))

# =============================
# 4️⃣ Train/test split (per video)
# =============================
split <- initial_split(video_features, strata = label)
train_data <- training(split) %>% select(-video_id)  # alleen features + label
test_data  <- testing(split) %>% select(-video_id)

# =============================
# 5️⃣ Random Forest model
# =============================
rf_spec <- rand_forest(mtry = 2, trees = 500) %>%
  set_engine("ranger") %>%
  set_mode("classification")

rf_workflow <- workflow() %>%
  add_model(rf_spec) %>%
  add_formula(label ~ .)

rf_fit <- fit(rf_workflow, train_data)

# =============================
# 6️⃣ Predict & evaluatie
# =============================
preds <- predict(rf_fit, test_data, type = "class") %>%
  bind_cols(test_data)

# Metrics
metrics(preds, truth = label, estimate = .pred_class)

# Confusion matrix
conf_mat(preds, truth = label, estimate = .pred_class)

