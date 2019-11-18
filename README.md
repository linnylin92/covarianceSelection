# Purpose

This repository contains all the data, functions, scripts to run simulations and analysis, and scripts to generate plots for the paper
"Covariance-based sample selection for heterogenous data: Applications to gene expression and autism risk gene detection".

# Installation

This package can be installed through `devtools` in R.

```{r}
library("devtools")
devtools::install_github("linnylin92/covarianceSelection", subdir = "covarianceSelection")
```
The package and downstream analysis and simulations depends on several packages, some of which originate
from BioConductor. 
These include `DBI`, `dequer`, `devtools`, `doMC`, `foreach`, `glmnet`, `hash`, `huge`, `igraph`, `MASS`, `Matrix`, and `org.Hs.eg.db`. 

Warning: The `doMC` package does not really work on Windows, as it does not seem to actually parallelize the code.
See: http://stackoverflow.com/questions/16453625/package-domc-not-available-for-r-version-3-0-0-warning-in-install-packages

# Data 

The two major datasets used in this article are also included in the repository.
The first dataset is the BrainSpan microarray measurements collected by Kang et al. (2011). While the original dataset 
is publicly available on GEO (\url{https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE25219}),
we provide a locally preprocessed dataset, which was created to be amendable for our analysis in R.
This dataset is a 105 MB `.RData` file, and is synced onto GitHub using the Git Large File Storage system (https://git-lfs.github.com/). Please
install this system before proceeding.


The second dataset is the p-value risk scores for the genes obtained applying
 the TADA framework (He et al., 2013) to the data available in De Rubeis et al. (2014). The full citations are given in the paper.
 
Supplementary datasets were also used to manage the data and assess the results. These are all documented appropriately under the file `covarianceSelection/R/data.R`.
All data used in this entire project are either publicly available or processed by our lab on publicly available data.

# Reproducing the results

## Note

All the code below were run on a server with 10 cores. If you do not have 10 cores, be sure to change the value of `ncores` appropriately in the following files:
`main/main.R` (for the data analysis) or `simulation/gaussian.R`, 
`simulation/gaussian_beta.R`, `simulation/nonparanormal.R`, `simulation/nonparanormal_beta.R`, 
`simulation/nonparanormal_goodness.R`, `simulation/nonparanormal_accelerated.R` and
`simulation/nonparanormal_accelerated_beta.R` (for the simulations).

All results produced are automatically placed in the `results/` folder as `.RData` files.

## Running the simulations

To reproduce the simulations (Section 5 of our paper), navigate to the `simulation` folder. All
simulations in this folder (documented below) take about 8 hours to finish.
From this location, run the following line in the command window to reproduce the 
results for Figure 6, 7, and 8A.

```
R CMD BATCH nonparanormal.R # this runs the simulation
R CMD BATCH nonparanormal_postprocess.R # this generates Figure 6
R CMD BATCH nonparanormal_postprocess_2.R # this generates Figure 7
R CMD BATCH nonparanormal_postprocess_3.R # this generates Figure 8A
```

Run the following line in the command window to reproduce the results for Figure 8B. 

```
R CMD BATCH nonparanormal_beta.R # this runs the simulation
R CMD BATCH nonparanormal_beta_postprocess.R # this generates Figure 8B
```

Run the following line in the command window to reproduce the results for Figure S.2 and S.3.

```
R CMD BATCH nonparanormal_goodness.R # this runs the simulation
R CMD BATCH nonparanormal_goodness_postprocess.R # this generates Figure 8B
```


## Running the analysis

To reproduce the analysis (Section 6 of our paper), navigate to the `main` folder. From this location, run the following lines in the command window.

```
R CMD BATCH analysis_overalpha.R
R CMD BATCH analysis_simultaenous.R
```

(These took 24 hours and 3.5 hours when we ran them respecitvely.) The first line of code runs a script to perform the analysis for varying values of `alpha`, for a total of 14 different analyses. 
The second line of code runs 3 analyses: the analysis using our method at `alpha` equal to 0.1, the analysis that uses only the samples from Window 1B, and the analysis that
uses all the samples in the BrainSpan dataset.

## Summarizing the results. reproducing the figures

These steps can only be done after you have run the simulation and analysis.
To summarize the results, navigate to the `figures` folder. Run the following code in the R console.

```{r}
source("summary_statistics.R")
```

To generate all the figures, run the appropriate R code for each figure. The files in the `figures` folder are titled appropriate to their corresponding figure in the paper.
For example, you can run the following line in the command window to reproduced Figure 2, which will be placed into the `figures` folder.

```
R CMD BATCH figure_2.R
```
