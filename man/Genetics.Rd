\name{Genetics}
\alias{Genetics}
\non_function{}
\title{Heritability data}
\description{
The \code{Genetics} data frame has 60 rows and 4 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
	\item{Location}{
	    a factor with levels \code{1} to \code{4} 
	}
	\item{Block}{
	    a factor with levels \code{1} to \code{3}
	}
	\item{Family}{
	    a factor with levels \code{1} to \code{5}
	}
	\item{Yield}{
	    a numeric vector of crop yields
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 4.5).
}
\examples{
options(contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
str(Genetics)
Genetics$LocFam <- with(Genetics, Location:Family)
Genetics$LocBloc <- with(Genetics, Location:Block)
fm1Gen <- lme(Yield ~ 1, Genetics, ~ 1 | LocBloc + LocFam + Location)
summary(fm1Gen)
summary(fm2Gen <- update(fm1Gen, Yield ~ Family))
}
\keyword{datasets}
