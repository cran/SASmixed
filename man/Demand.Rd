\name{Demand}
\alias{Demand}
\non_function{}
\title{Per-capita demand deposits by state and year}
\description{
    The \code{Demand} data frame has 77 rows and 8 columns of data on
    per-capita demand deposits by state and year.
}
\format{
    This data frame contains the following columns:
    \describe{
	\item{State}{
	    an ordered factor with levels
	    \code{WA} < \code{FL} < \code{CA} < \code{TX} < \code{IL} < \code{DC} < \code{NY}
	}
	\item{Year}{
	    an ordered factor with levels
	    \code{1949} < \dots{} < \code{1959}
	}
	\item{d}{
	    a numeric vector of per-capita demand deposits
	}
	\item{y}{
	    a numeric vector of permanent per-capita personal income
	}
	\item{rd}{
	    a numeric vector of service charges on demand deposits
	}
	\item{rt}{
	    a numeric vector of interest rates on time deposits
	}
	\item{rs}{
	    a numeric vector of interest rates on savings and loan
	    association shares.
	}
	\item{grp}{
	    a dummy factor with a single level.  This is used to
	    construct crossed random effects in \code{lme}.
	}
    }
}
\source{
    Littel, R. C., Milliken, G. A., Stroup, W. W., and Wolfinger,
    R. D. (1996), \emph{SAS System for Mixed Models}, SAS Institute
    (Data Set 1.2.4).

    Feige, E. L. (1964), \emph{The Demand for Liquid Assets: A Temporal
	Cross-Sectional Analysis.
}
\examples{
library(SASmixed)
data(Demand)
names( Demand )
formula( Demand )
# the "grp" factor is a dummy factor with only one level.
unique( Demand$grp )
# Crossed random-effects factors have to be created by pdIdent
#  applied to the indicator variables and joined by pdBlocked.
fm1Demand <-
  lme( log(d) ~ log(y) + log(rd) + log(rt) + log(rs), data = Demand,
  random = list(grp = pdBlocked(list(pdIdent(~ State - 1),
                                     pdIdent(~ Year - 1)))))
summary( fm1Demand )        # compare to output 3.13, p. 132
VarCorr( fm1Demand )
}
\keyword{datasets}
