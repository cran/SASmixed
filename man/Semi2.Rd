\name{Semi2}
\alias{Semi2}
\non_function{}
\title{Oxide layer thicknesses on semiconductors}
\description{
    The \code{Semi2} data frame has 72 rows and 5 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
	\item{Source}{
	    a factor with levels \code{1} and \code{2} 
	}
	\item{Lot}{
	    a factor with levels \code{1} to \code{8}
	}
	\item{Wafer}{
	    a factor with levels \code{1} to \code{3}
	}
	\item{Site}{
	    a factor with levels \code{1} to \code{3}
	}
	\item{Thickness}{
	    a numeric vector
	}
    }
}
\details{

}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 4.4).
}
\examples{
library(SASmixed)
options(
  contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
data(Semi2)
formula(Semi2)
fm1Semi2 <- lme( Thickness ~ 1, data = Semi2,
   random = ~ 1 | Lot/Wafer )
summary( fm1Semi2 )       # compare with output 4.13, p. 156
VarCorr( fm1Semi2 )
anova( fm1Semi2 )
fm2Semi2 <- update( fm1Semi2, Thickness ~ Source )
summary( fm2Semi2 )       # compare with output 4.15, p. 159
VarCorr( fm2Semi2 )
fm3Semi2 <- update( fm2Semi2, 
   random = list(Lot = pdDiag( ~ Source - 1 ), Wafer = ~ 1 ) )
summary( fm3Semi2 )       # compare with output 4.17, p. 163
VarCorr( fm3Semi2 )
}
\keyword{datasets}
