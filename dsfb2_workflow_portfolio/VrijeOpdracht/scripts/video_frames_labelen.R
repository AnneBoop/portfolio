
library(av)
library(tidyverse)

extract_frames <- function(video_dir, frames_dir, fps = 10) {
  video_files <- list.files(video_dir, full.names = TRUE)
  
  for (video in video_files) {
    video_id <- tools::file_path_sans_ext(basename(video))
    out_dir <- file.path(frames_dir, video_id)
    
    if (!dir.exists(out_dir)) {
      dir.create(out_dir, recursive = TRUE)
    }
    
    av_video_images(
      video,
      destdir = out_dir,
      format = "png",
      fps = fps
    )
    
    message("Frames opgeslagen voor video: ", video_id)
  }
  
  message("Klaar!")
}

extract_frames(
  video_dir  = "dsfb2_workflows_portfolio2/VrijeOpdracht/videoFragmenten/Trainingsdata/RawData/MislukteGrijppoging/",
  frames_dir = "dsfb2_workflows_portfolio2/VrijeOpdracht/videoFragmenten/Trainingsdata/FotoFragmenten/MislukteGrijppogingen/"
)

extract_frames(
  video_dir  = "dsfb2_workflows_portfolio2/VrijeOpdracht/videoFragmenten/Trainingsdata/RawData/SuccesvolleGrijppoging/",
  frames_dir = "dsfb2_workflows_portfolio2/VrijeOpdracht/videoFragmenten/Trainingsdata/FotoFragmenten/SuccesvolleGrijppogingen/"
)

## Frames worden per video gelabeld

library(tidyverse)

make_video_table <- function(frames_dir, label) {
  video_dirs <- list.dirs(frames_dir, recursive = FALSE)
  
  tibble(
    video_id = basename(video_dirs),
    frames = map(video_dirs, ~ list.files(.x, full.names = TRUE)),
    label = label
  )
}

video_dataset <- bind_rows(
  make_video_table(
    "dsfb2_workflows_portfolio2/VrijeOpdracht/videoFragmenten/Trainingsdata/FotoFragmenten/MislukteGrijppogingen/",
    "mislukt"
  ),
  make_video_table(
    "dsfb2_workflows_portfolio2/VrijeOpdracht/videoFragmenten/Trainingsdata/FotoFragmenten/SuccesvolleGrijppogingen/",
    "succes"
  )
)

