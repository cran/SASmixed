\name{Weights}
\alias{Weights}
\non_function{}
\title{Data from a weight-lifting program}
\description{
    The \code{Weights} data frame has 399 rows and 5 columns.
}
\format{
  This data frame contains the following columns:
  \describe{
    \item{strength}{
      a numeric vector
    }
    \item{Subject}{
      a factor with levels \code{1} to \code{21}
    }
    \item{Program}{
      a factor with levels
      \code{CONT} (continuous repetitions and weights),
      \code{RI} (repetitions increasing) and
      \code{WI} (weights increasing)
    }
    \item{Subj}{
      an ordered factor indicating the subject on which the
      measurement is made
    }
    \item{Time}{
      a numeric vector indicating the time of the measurement
    }
  }
}
\source{
  Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
  R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
  (Data Set 3.2(a)).
}
\examples{
options(
  contrasts = c(unordered = "contr.SAS", ordered = "contr.poly"))
data(Weights)
fm1Weight <- lme( strength ~ Program * Time,
                  data = Weights, random = ~ 1 | Subj)
summary( fm1Weight )               # compare with output 3.1, p. 91
VarCorr( fm1Weight )
anova( fm1Weight )
fm2Weight <- update( fm1Weight, random = ~ Time | Subj )
anova( fm1Weight, fm2Weight )
summary( fm2Weight )
VarCorr( fm2Weight )
intervals( fm2Weight )
\dontrun{
fm3Weight <- update( fm2Weight, correlation = corAR1())
anova( fm2Weight, fm3Weight )
fm4Weight <- update( fm3Weight, strength ~ Program * (Time + I(Time^2)),
                    random = ~Time|Subj)
summary( fm4Weight )
VarCorr( fm4Weight )
anova( fm4Weight )
intervals( fm4Weight )
}
}
\keyword{datasets}
