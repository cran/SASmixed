\name{AvgDailyGain}
\alias{AvgDailyGain}
\non_function{}
\title{Average daily weight gain of steers on different diets}
\description{
    The \code{AvgDailyGain} data frame has 32 rows and 6 columns.
}
\format{
    This data frame contains the following columns:
    \describe{
	\item{Id}{
	    the animal number
	}
	\item{Block}{
	    an ordered factor indicating the barn in which the steer was housed.
	}
	\item{Treatment}{
	    an ordered factor with levels
	    \code{0} < \code{10} < \code{20} < \code{30}
	    indicating the amount of medicated feed additive added to
	    the base ration.
	}
	\item{adg}{
	    a numeric vector of average daily weight gains over a period
	    of 160 days.
	}
	\item{InitWt}{
	    a numeric vector giving the initial weight of the animal
	}
	\item{Trt}{
	    the \code{Treatment} as a numeric variable
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 5.3).
}
\examples{
#options(
#  contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
## plot of adg versus Treatment by Block
gplot(AvgDailyGain)
fm1Adg <- lme(adg ~ InitWt * Treatment - 1, 
      data = AvgDailyGain, random = ~ 1 | Block)
summary(fm1Adg) # compare with output 5.1, p. 178
anova(fm1Adg)   # checking significance of terms
fm2Adg <- update(fm1Adg, adg ~ InitWt + Treatment)  # common slope model
summary(fm2Adg)
anova(fm2Adg)
summary(update(fm1Adg, adg ~ InitWt + Treatment - 1))
}
\keyword{datasets}
