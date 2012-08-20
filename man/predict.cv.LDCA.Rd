\name{predict.cv.LDCA}
\alias{predict.cv.LDCA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
prediction function for cv.LDCA
}
\description{
prediction function for cv.LDCA
}
\usage{
\method{predict}{cv.LDCA}(object, newx, s = c("lambda.lse", "lambda.min"), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
a cv.LDCA object
}
  \item{newx}{
new data matrix
}
  \item{s}{
lambda value at which the prediction is returned.
}
  \item{\dots}{
other arguments
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
