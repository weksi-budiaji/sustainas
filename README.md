# sustainas

**Integrated computational workflow for RAPFISH, Livelihood Vulnerability Index (LVI), and influence–interest stakeholder analysis**

## Overview

**sustainas** is an R package for computational sustainability assessment. It provides a unified workflow for implementing **Rapid Appraisal for Fisheries (RAPFISH)**, the **Livelihood Vulnerability Index (LVI)**, and **influence–interest stakeholder analysis** within a single scripting environment.

The package automates RAPFISH ordination, leverage analysis, Monte Carlo simulation, LVI computation, and stakeholder classification while providing standardized graphical outputs for interpretation. Each analytical module can be used independently or combined within the same workflow according to the objectives of a sustainability assessment.

The package is intended for researchers, practitioners, and decision-makers conducting sustainability assessments in environmental, fisheries, agricultural, rural development, and natural resource management studies.

---

## Key Features

- **RAPFISH analysis**
  - Multidimensional scaling (MDS) ordination
  - Sustainability index estimation
  - Automated anchor matrix generation
  - Good–Bad–Up–Down reference points
  - Ordination visualization

- **Leverage and uncertainty analysis**
  - Root Mean Square (RMS) leverage analysis
  - Monte Carlo simulation
  - Summary plots for uncertainty assessment

- **Livelihood Vulnerability Index (LVI)**
  - Component aggregation
  - Livelihood vulnerability index calculation
  - Radar plot visualization

- **Influence–interest stakeholder analysis**
  - Stakeholder classification
  - Four-quadrant influence–interest mapping
  - Graphical stakeholder plots

- **Reproducible workflow**
  - Script-based implementation
  - Example datasets included
  - Standardized analytical outputs

---

## Installation

Install the released version from Github

```r
install.packages("remote")
remotes::install_github("weksi-budiaji/sustainas")
```

Load the package

```r
library(sustainas)
```

---

## Included Example Datasets

The package includes several datasets for reproducing the examples in the documentation.

| Dataset | Description |
|----------|-------------|
| `social` | Example dataset for RAPFISH analysis |
| `three` | Example dataset for Livelihood Vulnerability Index (LVI) |
| `sldata` | Example dataset for influence–interest stakeholder analysis |

---

## Typical Workflow

```r
library(sustainas)

# RAPFISH
data(social)

res <- rapfish(social)
rapplot(res)

# Leverage analysis
leverage(social, res)

# Monte Carlo simulation
sim <- mc_triangular(10, social)
rapsummary(sim)

# Livelihood Vulnerability Index
data(three)

lvi_res <- lvi(
  three,
  sub.id = c(1, 9, 16),
  dim.name = c("Social","Institution","Technology")
)

radarplot(lvi_res)

# Stakeholder analysis
data(sldata)

iiplot(sldata)
```

---

## Main Functions

| Function | Description |
|----------|-------------|
| `rapfish()` | RAPFISH sustainability analysis |
| `rapplot()` | RAPFISH ordination plot |
| `leverage()` | RAPFISH leverage analysis |
| `mc_triangular()` | Monte Carlo simulation (triangular distribution) |
| `mc_normal()` | Monte Carlo simulation (normal distribution) |
| `rapsummary()` | Monte Carlo summary plots |
| `lvi()` | Livelihood Vulnerability Index |
| `radarplot()` | Radar plot for LVI results |
| `iiplot()` | Influence–interest stakeholder plot |

---

## Documentation

Complete documentation is available through

```r
help(package = "sustainas")
```

or

```r
browseVignettes("sustainas")
```

---

## Citation

If you use **sustainas** in published research, please cite

```r
citation("sustainas")
```

---

## License

Released under the GPL (>= 2) license.

---

## Author

**Weksi Budiaji**

Email: budiaji@untirta.ac.id
