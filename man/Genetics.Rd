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
library(SASmixed)
data(Genetics)
options(
  contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
formula( Genetics )
fm1Gen <- lme( Yield ~ 1, data = Genetics,
   random = list(Location = pdCompSymm(~ Family - 1), Block = ~ 1) )
summary( fm1Gen )
VarCorr( fm1Gen )      # compare with Output 4.18, p. 165
anova( fm1Gen )
}
\keyword{datasets}
