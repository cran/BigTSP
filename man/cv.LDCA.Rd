\name{cv.LDCA}
\alias{cv.LDCA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Cross validation for LDCA
}
\description{
Cross validation for LDCA
}
\usage{
cv.LDCA(X, y, lambda = NULL, nfolds)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{input matrix, of dimension nobs x nvars; each row is an
  observation vector.
}
  \item{y}{
response variable.
}
  \item{lambda}{
user specified lambda sequence
}
  \item{nfolds}{
number of folds - default is 10.
}
}
\value{
an object of class \code{"cv.LDCA"} is returned, which is a
  list with the ingredients of the cross-validation fit.
  \item{lambda}{the values of \code{lambda} used in the fits.}
  \item{cvm}{The mean cross-validated error - a vector of length
    \code{length(lambda)}.}
  \item{cvsd}{estimate of standard error of \code{cvm}.}
  \item{cvup}{upper curve = \code{cvm+cvsd}.}
  \item{cvlo}{lower curve = \code{cvm-cvsd}.}
  \item{nzero}{number of non-zero coefficients at each \code{lambda}.}
  \item{name}{a text string indicating type of measure (for plotting
    purposes).}
 \item{glmnet.fit}{a fitted glmnet object for the full data.}
  \item{lambda.min}{value of \code{lambda} that gives minimum
    \code{cvm}.}
  \item{lambda.1se}{largest value of \code{lambda} such that error is
    within 1 standard error of the minimum.}
}
\references{
Friedman, J., Hastie, T. and Tibshirani, R. (2008)
  \emph{Regularization Paths for Generalized Linear Models via Coordinate
    Descent},   \url{http://www.stanford.edu/~hastie/Papers/glmnet.pdf}\cr
  \emph{Journal of Statistical Software, Vol. 33(1), 1-22 Feb 2010}\cr
  \url{http://www.jstatsoft.org/v33/i01/}\cr
  Simon, N., Friedman, J., Hastie, T., Tibshirani, R. (2011)
  \emph{Regularization Paths for Cox's Proportional Hazards Model via
    Coordinate Descent, Journal of Statistical Software, Vol. 39(5)
    1-13}\cr
  \url{http://www.jstatsoft.org/v39/i05/}
}
\author{
Xiaolin Yang, Han Liu
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{print.cv.LDCA}},\code{\link{predict.cv.LDCA}},
}
\examples{
library(glmnet)
x=matrix(rnorm(50*20),50,20)
y=rbinom(50,1,0.5)
cvfit=cv.LDCA(x,y,nfolds=5)
predict(cvfit,x[1:10,],s="lambda.min")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
