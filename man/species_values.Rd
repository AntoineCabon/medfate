\encoding{UTF-8}
\name{Species values}
\alias{species_basalArea}
\alias{species_cover}
\alias{species_density}
\alias{species_foliarBiomass}
\alias{species_fuel}
\alias{species_LAI}
\alias{species_phytovolume}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Species description functions}
\description{
Functions to calculate attributes of a \code{\link{forest}} object by species.
}
\usage{
species_basalArea(x, SpParams)
species_cover(x, SpParams)
species_density(x, SpParams)
species_foliarBiomass(x, SpParams, gdd = NA)
species_fuel(x, SpParams, gdd = NA, includeDead = TRUE)
species_LAI(x, SpParams, gdd = NA)
species_phytovolume(x, SpParams)
}
\arguments{
  \item{x}{An object of class \code{\link{forest}}.}
  \item{SpParams}{A data frame with species parameters (see \code{\link{SpParamsMED}}).}
  \item{gdd}{Growth degree days (to account for leaf phenology effects).}
  \item{includeDead}{A flag to indicate that standing dead fuels (dead branches) are included.}
}
\value{
A vector with values for each species in \code{SpParams}:
\itemize{
\item{\code{species_basalArea}: Species basal area (m2/ha).}
\item{\code{species_cover}: Shrub cover (in percent).}
\item{\code{species_density}: Plant density (ind/ha). Tree density is directly taken from the forest object, while the shrub density is estimated from cover and height by calculating the area of a single individual.}
\item{\code{species_foliarBiomass}: Standing biomass of leaves (in kg/m2).}
\item{\code{species_fuel}: Fine fuel load (in kg/m2).}
\item{\code{species_LAI}: Leaf area index (m2/m2).}
\item{\code{species_phytovolume}: Shrub phytovolume (m3/m2).}
}
}
\author{
Miquel De \enc{Cáceres}{Caceres} Ainsa, CTFC
}
\seealso{
 \code{\link{spwb}}, \code{\link{forest}}, \code{\link{plant_basalArea}}, \code{\link{summary.forest}}
}
\examples{
#Default species parameterization
data(SpParamsMED)

#Load example plot
data(exampleforest)

#Species basal area
species_basalArea(exampleforest, SpParamsMED)
}