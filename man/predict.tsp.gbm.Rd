\name{predict.tsp.gbm}
\alias{predict.tsp.gbm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
prediction function for tsp.gbm
}
\description{
prediction function for tsp.gbm
}
\usage{
\method{predict}{tsp.gbm}(object, newdata, n.trees, type = "link", single.tree = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
a tsp.gbm object
}
  \item{newdata}{
new data matrix
}
  \item{n.trees}{
Number of trees used in the prediction. n.trees may be a vector in which case predictions are returned for each iteration specified
}
  \item{type}{
The scale on which gbm makes the predictions
}
  \item{single.tree}{
If single.tree=TRUE then predict.tsp.gbm returns only the predictions from tree(s) n.trees
}
  \item{\dots}{
not used.
}
}

\references{
gbm package
}
\author{
Xiaolin Yang, Han Liu
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
library(gbm)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
fit=tsp.gbm(x,y)
predict(fit,x[1:10,],n.trees=5)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
