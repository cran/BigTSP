\name{predict.LDCA}
\alias{predict.LDCA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
predict function for LDCA
}
\description{
predict function for LDCA
}
\usage{
\method{predict}{LDCA}(object, newx, s = NULL, type = c("link", "response", "coefficients", "nonzero", "class"), exact = FALSE, offset, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
an LDCA object
}
  \item{newx}{
new data matrix
}
  \item{s}{
lambda value at which the prediction is returned.
}
  \item{type}{
  Type of prediction required. Type "link" gives the linear predictors for "binomial", "multinomial", "poisson" or "cox" models; for "gaussian" models it gives the fitted values. Type "response" gives the fitted probabilities for "binomial" or "multinomial", fitted mean for "poisson" and the fitted relative-risk for "cox"; for "gaussian" type "response" is equivalent to type "link". Type "coefficients" computes the coefficients at the requested values for s. Note that for "binomial" models, results are returned only for the class corresponding to the second level of the factor response. Type "class" applies only to "binomial" or "multinomial" models, and produces the class label corresponding to the maximum probability. Type "nonzero" returns a list of the indices of the nonzero coefficients for each value of s.
}
  \item{exact}{
By default (exact=FALSE) the predict function uses linear interpolation to make predictions for values of s that do not coincide with those used in the fitting algorithm. Currently exact=TRUE is not implemented, but prints an error message telling the user how to achieve the exact predictions. This is done my rerunning the algorithm with the desired values interspersed (in order) with the values used in the original fit. This is easily achieved via the R command lamba=sort(c(object$lambda, new.lambda))
}
  \item{offset}{
If an offset is used in the fit, then one must be supplied for making predictions (except for type="coefficients" or type="nonzero")
}
 \item{\dots}{
other arguments.
}
}

\author{
Xiaolin Yang, Han Liu
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
