# Portfolio Workflows – Data Science for Biology

Auteur: Anne Bakker
datum: 04-01-2026
Dit repository bevat mijn portfolio voor de cursus **Workflows** binnen de opleiding **Data Science for Biology**.  
Het portfolio laat zien dat ik vaardigheden beheers op het gebied van data-analyse, data management, reproducible science, SQL, R packages en het werken met Rmarkdown en bookdown.

Het portfolio is opgezet volgens de principes van **Guerilla Analytics** en **Reproducible Research**.

---

## Inhoud van het portfolio

### 1. CV en toekomstplan

#### 1a. Curriculum Vitae
In deze sectie staat mijn **Curriculum Vitae**, opgesteld met **Rmarkdown**.  
Het CV is professioneel vormgegeven en geschikt voor gebruik bij sollicitaties voor stages of banen.  
Hierin worden onder andere mijn vaardigheden, ervaring en **Data Science for Biology skills** beschreven.

Bij het maken van het CV is gebruikgemaakt van bestaande Rmarkdown-templates. De gebruikte templates zijn correct vermeld en gecrediteerd.

> Let op: omdat dit portfolio online beschikbaar is, zijn gevoelige persoonsgegevens en foto’s weggelaten.

#### 1b. Plan voor de toekomst
In dit onderdeel beschrijf ik mijn toekomstvisie en professionele ontwikkeling:
- Mijn gewenste werkplek en droombaan over 1–2 jaar  
- Mijn huidige vaardigheden en startpositie  
- Skills die ik nog wil of moet ontwikkelen  

Deze reflectie vormt de basis voor de keuze van de nieuwe skill in de vrije opdracht.

---

### 2. Vrije opdracht

Voor de vrije opdracht is **32 uur zelfstudietijd** besteed aan het leren van een nieuwe, zelfgekozen **Data Science for Biology skill**.

Dit onderdeel bestaat uit:
1. **Keuze en onderbouwing van de skill**, gekoppeld aan mijn toekomstplan  
2. **Planning**, inclusief leerdoelen, tijdsplanning en manier van aantonen  
3. **Uitwerking**, waarin ik laat zien dat ik de skill beheers door deze toe te passen op nieuw materiaal (bijvoorbeeld een andere dataset)

De volledige uitwerking, inclusief code en toelichting, is opgenomen in dit portfolio.

---

### 3. Data management

#### 3a. RNA-seq formatieve opdracht (DAUR2)
In dit onderdeel zijn de **Guerilla Analytics-regels** toegepast op een RNA-seq analyse:
- Een correcte mapstructuur voor data, scripts en output  
- Een README-bestand waarin de inhoud van de mappen wordt beschreven  
- Screenshots van de mapstructuur, gegenereerd met `fs::dir_tree()`  
- Screenshot van het README-bestand

#### 3b. Portfolio repository
Dezelfde data management-principes zijn toegepast op dit portfolio-repository zelf.  
Ook hier zijn screenshots en een README opgenomen.

---

### 4. Reproducible Science

#### 4a. Reproduceren van een data-analyse
In dit onderdeel is een bestaande dataset geanalyseerd en reproduceerbaar uitgewerkt in **Rmarkdown**.  
De analyse bevat:
- Inlezen en inspectie van de data  
- Visualisaties met correcte schalen, kleuren en symbolen  
- Normalisatie ten opzichte van de negatieve controle  
- Uitleg van controles en normalisatie  
- Een stappenplan voor vervolgonderzoek (dose-response analyse met het `drc` package)

#### 4b. Beoordelen van een artikel op reproduceerbaarheid
Een artikel uit **PLOS One** is beoordeeld op transparantie en reproduceerbaarheid.  
Dit omvat:
- Beschrijving van het artikel en de onderzoeksvraag  
- Beoordeling op transparantiecriteria  
- Analyse van de gedeelde R code  
- Poging tot reproduceren van minimaal één figuur  
- Reflectie op de reproduceerbaarheid

---

### 5. SQL

In dit onderdeel laat ik zien dat ik SQL kan gebruiken voor data-analyse:
- Opschonen en voorbereiden van datasets in R  
- Importeren van data in een PostgreSQL database  
- Uitvoeren van inspecties en joins met SQL  
- Exporteren van resultaten en visualisatie in R  

Alle stappen zijn gedocumenteerd in het portfolio.

---

### 6. R package

In deze opdracht heb ik een **eigen R package** ontwikkeld en gedeeld via GitHub.  
Het package voldoet aan alle eisen:
- Minimaal vier zelfgeschreven functies  
- Roxygen2 documentatie  
- DESCRIPTION en NAMESPACE bestanden  
- Een vignette met uitleg en voorbeelden  
- Installatie via `devtools::install_github()`

---

### 7. Bronvermelding

Dit onderdeel bevat een introductie voor mijn **Projecticum project**, inclusief:
- Minimaal vijf relevante bronnen  
- Een `.bib` bestand  
- Automatische inline citaties  
- Een correcte referentielijst

---

### 8. Geparametrizeerde Rmarkdown

In dit onderdeel is een **geparametrizeerd Rmarkdown rapport** gemaakt voor COVID-19 data in Europa.  
Het rapport bevat parameters voor:
- Land  
- Jaar  
- Maanden  

Daarnaast bevat het rapport grafieken voor:
- Aantal COVID-19 gevallen  
- Aantal COVID-19 gerelateerde sterfgevallen  

In het portfolio is op een creatieve manier aangetoond dat het rapport dynamisch gegenereerd kan worden.

---

## Bookdown: portfolio genereren

Dit portfolio is opgezet als een **bookdown-project**.

### Benodigde packages
Zorg ervoor dat de volgende packages geïnstalleerd zijn:
```r
install.packages(c("bookdown", "rmarkdown"))
