\name{print.LDCA}
\alias{print.LDCA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
print the LDCA object
}
\description{
print the LDCA object
}
\usage{
\method{print}{LDCA}(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
the LDCA object
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
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
fit=LDCA(x,y)
print(fit)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
