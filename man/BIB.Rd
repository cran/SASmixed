\name{BIB}
\alias{BIB}
\non_function{}
\title{Data from a balanced incomplete block design}
\description{
    The \code{BIB} data frame has 24 rows and 5 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
	\item{Block}{
	    an ordered factor with levels
	    \code{1} < \code{2} < \code{3} < \code{8} < \code{5} < \code{4} < \code{6} < \code{7}
	}
	\item{Treatment}{
	    a treatment factor with levels \code{1} to \code{4}.
	}
	\item{y}{
	    a numeric vector representing the response
	}
	\item{x}{
	    a numeric vector representing the covariate
	}
	\item{Grp}{
	    a factor with levels
	    \code{13} and 
	    \code{24} 
	}
    }
}
\details{
    These appear to be constructed data.
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 5.4).
}
\examples{
library(SASmixed)
data(BIB)
options(
  contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
coplot(y ~ x | Block, data = BIB, show = FALSE)
fm1BIB <- lme(y ~ Treatment * x, data = BIB, random = ~ 1 | Block)
summary(fm1BIB)   # compare with Output 5.7, p. 188
VarCorr(fm1BIB)
anova(fm1BIB)     # strong evidence of different slopes
fm2BIB <- lme(y ~ Treatment + x : Grp, data = BIB,
              random = ~ 1 | Block)
summary(fm2BIB)   # compare with Output 5.9, p. 193
VarCorr(fm2BIB)
anova(fm2BIB)
}
\keyword{datasets}
