\name{predict.tsp.randomForest}
\alias{predict.tsp.randomForest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
prediction function for tsp.randomForest
}
\description{
prediction function for tsp.randomForest
}
\usage{
\method{predict}{tsp.randomForest}(object, newdata, type = "response", norm.votes = TRUE, predict.all = FALSE, proximity = FALSE, nodes = FALSE, cutoff, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
a tsp.randomForest object
}
  \item{newdata}{
new data matrix
}
  \item{type}{
one of response, prob. or votes, indicating the type of output: predicted values, matrix of class probabilities, or matrix of vote counts. class is allowed, but automatically converted to ''response", for backward compatibility.
}
  \item{norm.votes}{
Should the vote counts be normalized (i.e., expressed as fractions)? 
}
  \item{predict.all}{
Should the predictions of all trees be kept?
}
  \item{proximity}{
Should proximity measures be computed? 
}
  \item{nodes}{
Should the terminal node indicators (an n by ntree matrix) be return? If so, it is in the ''nodes" attribute of the returned object.
}
  \item{cutoff}{
A vector of length equal to number of classes. The 'winning' class for an observation is the one with the maximum ratio of proportion of votes to cutoff. 
}
  \item{\dots}{
not used.
}
}

\references{
randomForest package.
}
\author{
Xiaolin Yang, Han Liu
}

\examples{
library(randomForest)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
y=as.factor(y)
fit=tsp.randomForest(x,y)
predict(fit,x[1:10,])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
