\encoding{UTF-8}
\name{conductancefunctions}
\alias{hydraulics_psi2K}
\alias{hydraulics_K2Psi}
\alias{hydraulics_averagePsi}
\alias{hydraulics_psiCrit}
\alias{hydraulics_vulnerabilityCurvePlot}
\alias{hydraulics_vanGenuchtenConductance}
\alias{hydraulics_xylemConductance}
\alias{hydraulics_xylemPsi}
\alias{hydraulics_psi2Weibull}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Hydraulic confuctance functions
}
\description{
Set of functions used in the calculation of soil and plant hydraulic conductance.
}
\usage{
hydraulics_psi2K(psi, Psi_extract, ws = 3.0)
hydraulics_K2Psi(K, Psi_extract, ws = 3.0)
hydraulics_averagePsi(psi, v, c, d)
hydraulics_vulnerabilityCurvePlot(x, soil = NULL, type="leaf",  
                                  psiVec =  seq(-0.1, -8.0, by =-0.01), 
                                  relative = FALSE, draw = TRUE)   
hydraulics_psiCrit(c, d, pCrit = 0.001)
hydraulics_vanGenuchtenConductance(psi, krhizomax, n, alpha)
hydraulics_xylemConductance(psi, kxylemmax, c, d)
hydraulics_xylemPsi(kxylem, kxylemmax, c, d)
hydraulics_psi2Weibull(psi50, psi88)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{psi}{A scalar (or a vector, depending on the function) with water potential (in MPa).}
  \item{K}{Whole-plant relative conductance (0-1).}
  \item{Psi_extract}{Soil water potential (in MPa) corresponding to 50\% whole-plant relative conductance.}
  \item{ws}{Exponent of the whole-plant relative conductance Weibull function.}
  \item{v}{Proportion of fine roots within each soil layer.}
  \item{krhizomax}{Maximum rhizosphere hydraulic conductance (defined as flow per leaf surface unit and per pressure drop).}
  \item{kxylemmax}{Maximum xylem hydraulic conductance (defined as flow per leaf surface unit and per pressure drop).}
  \item{c, d}{Parameters of the Weibull function (generic xylem vulnerability curve).}
  \item{n, alpha}{Parameters of the Van Genuchten function (rhizosphere vulnerability curve).}
  \item{kxylem}{Xylem hydraulic conductance (defined as flow per surface unit and per pressure drop).}
  \item{x}{An object of class \code{\link{spwbInput}}.}
  \item{soil}{A list containing the description of the soil (see \code{\link{soil}}).}
  \item{type}{Plot type. For \code{hydraulics_supplyFunctionPlot}, either \code{"E"}, \code{"Elayers"}, \code{"PsiStem"}, \code{"PsiRoot"}, \code{"PsiRhizo"} or \code{"dEdP"}). For \code{hydraulics_vulnerabilityCurvePlot}, either \code{"leaf"}, \code{"stem"}, \code{"root"}, or \code{"rhizosphere"}).}
  \item{psiVec}{Vector of water potential values to evaluate for the vulnerability curve.}
  \item{relative}{A flag to relativize vulnerability curves to the [0-1] interval.}
  \item{draw}{A flag to indicate whether the vulnerability curve should be drawn or just returned.}
  \item{pCrit}{Proportion of maximum conductance considered critical for hydraulic functioning.}
  \item{psi50, psi88}{Water potentials (in MPa) corresponding to 50\% and 88\% of percent loss of conductance.}
}
\details{
Details of the hydraulic model are given in a vignette. Function \code{hydraulics_vulnerabilityCurvePlot} draws a plot of the vulnerability curves for the given \code{soil} object and network properties of each plant cohort in \code{x}.
}
\value{
Values returned for each function are:
\itemize{
\item{\code{hydraulics_psi2K}: Whole-plant relative conductance (0-1).}
\item{\code{hydraulics_K2Psi}: Soil water potential (in MPa) corresponding to the given whole-plant relative conductance value (inverse of \code{hydraulics_psi2K()}).}
\item{\code{hydraulics_averagePsi}: The average water potential (in MPa) across soil layers.}
\item{\code{hydraulics_vanGenuchtenConductance}: Rhizosphere conductance corresponding to an input water potential (soil vulnerability curve).}
\item{\code{hydraulics_xylemConductance}: Xylem conductance (flow rate per pressure drop) corresponding to an input water potential (plant vulnerability curve).}
\item{\code{hydraulics_xylemPsi}: Xylem water potential (in MPa) corresponding to an input xylem conductance (flow rate per pressure drop).}
\item{\code{hydraulics_psi2Weibull}: Parameters of the Weibull vulnerability curve that goes through the supplied psi50 and psi88 values.}
}
}
\references{
Sperry, J. S., F. R. Adler, G. S. Campbell, and J. P. Comstock. 1998. Limitation of plant water use by rhizosphere and xylem conductance: results from a model. Plant, Cell \& Environment 21:347–359.

Sperry, J. S., and D. M. Love. 2015. What plant hydraulics can tell us about responses to climate-change droughts. New Phytologist 207:14–27.
}
\author{
Miquel De \enc{Cáceres}{Caceres} Ainsa, Centre Tecnologic Forestal de Catalunya
}
\seealso{
\code{\link{hydraulics_supplyFunctionPlot}}, \code{\link{hydraulics_maximumStemHydraulicConductance}}, \code{\link{spwb}}, \code{\link{soil}}
}
\examples{
kstemmax = 4 # in mmol·m-2·s-1·MPa-1
stemc = 3 
stemd = -4 # in MPa

psiVec = seq(-0.1, -7.0, by =-0.01)

#Vulnerability curve
kstem = unlist(lapply(psiVec, hydraulics_xylemConductance, kstemmax, stemc, stemd))
plot(-psiVec, kstem, type="l",ylab="Xylem conductance (mmol·m-2·s-1·MPa-1)", 
xlab="Canopy pressure (-MPa)", lwd=1.5,ylim=c(0,kstemmax))
}
