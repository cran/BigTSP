\name{print.cv.LDCA}
\alias{print.cv.LDCA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
print function for cv.LDCA
}
\description{
print function for cv.LDCA
}
\usage{
\method{print}{cv.LDCA}(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
cv.LDCA object
}
  \item{\dots}{
other arguments
}
}

\author{
Xiaolin Yang
}

\examples{
library(glmnet)
x=matrix(rnorm(50*20),50,20)
y=rbinom(50,1,0.5)
cvfit=cv.LDCA(x,y,nfolds=5)
print(cvfit)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
