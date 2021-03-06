% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kuenm_proc.R
\name{kuenm_proc}
\alias{kuenm_proc}
\title{Partial ROC calculation of single models}
\usage{
kuenm_proc(occ.test, model, threshold = 5, rand.percent = 50,
  iterations = 500)
}
\arguments{
\item{occ.test}{a numerical matrix containing coordinates of the occurrences used to test
the ecological niche model to be evaluated; columns must be: longitude and latitude.}

\item{model}{a RasterLayer of the ecological niche model to be evaluated.}

\item{threshold}{(numeric) value from 0 to 100 that will be used as threshold (E);
default = 5.}

\item{rand.percent}{(numeric) value from 0 to 100 representing the percent of testing data
to be used for performing the bootstrap process for calculating the partial ROC;
default = 50.}

\item{iterations}{(numeric) number of bootstrap iterations to be performed;
default = 500.}
}
\value{
A list containing a named vector with the final partial ROC results and
a matrix containing the AUC values and AUC ratios calculated for each iteration.
}
\description{
kuenm_proc applies partial ROC tests to single models.
}
\details{
Partial ROC is calculated following Peterson et al.
(2008; \url{http://dx.doi.org/10.1016/j.ecolmodel.2007.11.008}). This function is a modification
of the \code{\link[ENMGadgets]{PartialROC}} funcion, available at \url{https://github.com/narayanibarve/ENMGadgets}.
}
\examples{
occ <- read.csv(list.files(system.file("extdata", package = "kuenm"),
                           pattern = "sp_test.csv", full.names = TRUE))
model <- raster::raster(list.files(system.file("extdata", package = "kuenm"),
                                   pattern = "sp_model.tif", full.names = TRUE))
thres <- 5
rand_perc <- 50
iterac <- 500

p_roc <- kuenm_proc(occ.test = occ, model = model, threshold = thres,
                   rand.percent = rand_perc, iterations = iterac)
}
