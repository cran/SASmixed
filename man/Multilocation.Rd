\name{Multilocation}
\alias{Multilocation}
\non_function{}
\title{A multilocation trial}
\description{
    The \code{Multilocation} data frame has 108 rows and 7 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
	\item{obs}{
	    a numeric vector
	}
	\item{Location}{
	    an ordered factor with levels
	    \code{B} < \code{D} < \code{E} < \code{I} < \code{G} <
	    \code{A} < \code{C} < \code{F} < \code{H}
	}
	\item{Block}{
	    a factor with levels \code{1} to \code{3} 
	}
	\item{Trt}{
	    a factor with levels \code{1} to \code{4}
	}
	\item{Adj}{
	    a numeric vector
	}
	\item{Fe}{
	    a numeric vector
	}
	\item{Grp}{
	    an ordered factor with levels
	    \code{B/1} < \code{B/2} < \code{B/3} < \code{D/1} <
	    \code{D/2} < \code{D/3} < \code{E/1} < \code{E/2} <
	    \code{E/3} < \code{I/1} < \code{I/2} < \code{I/3} <
	    \code{G/1} < \code{G/2} < \code{G/3} < \code{A/1} <
	    \code{A/2} < \code{A/3} < \code{C/1} < \code{C/2} <
	    \code{C/3} < \code{F/1} < \code{F/2} < \code{F/3} <
	    \code{H/1} < \code{H/2} < \code{H/3}
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 2.8.1).
}
\examples{
library(SASmixed)
options(
  contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
data(Multilocation)
formula( Multilocation )
names( Multilocation )
### Create a Block %in% Location factor
Multilocation$Grp <-
  getGroups( Multilocation, form = ~ Location/Block, level = 2 )
fm1Mult <- lme( Adj ~ Location * Trt, data = Multilocation, ~ 1 | Grp)
summary( fm1Mult )
VarCorr( fm1Mult )
anova( fm1Mult )
fm2Mult <- update( fm1Mult, Adj ~ Location + Trt )
fm3Mult <- update( fm1Mult, Adj ~ Location )
fm4Mult <- update( fm1Mult, Adj ~ Trt )
fm5Mult <- update( fm1Mult, Adj ~ 1 )
summary( fm2Mult )
VarCorr( fm2Mult )
anova( fm2Mult )
### Treating the location as a random effect
fm1MultR <- lme( Adj ~ Trt, data = Multilocation,
  random = list( Location = pdCompSymm( ~ Trt - 1 ), Block = ~ 1 ) )
summary( fm1MultR )
intervals( fm1MultR )
VarCorr( fm1MultR )
anova( fm1MultR )
\dontrun{
fm2MultR <-
  update( fm1MultR, random = list( Location = ~ Trt - 1, Block = ~ 1 ))
anova( fm1MultR, fm2MultR )
}
}
\keyword{datasets}
