\name{predict.tsp.tree}
\alias{predict.tsp.tree}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
prediction function for tsp.tree
}
\description{
prediction function for tsp.tree
}
\usage{
\method{predict}{tsp.tree}(object, newdata, type = c("vector", "tree", "class", "where"), split = FALSE, nwts, eps = 0.001, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
a tsp.tree object
}
  \item{newdata}{
new data matrix
}
  \item{type}{
character string denoting whether the predictions are returned as a vector (default) or as a tsp.tree object.
}
  \item{split}{
governs the handling of missing values. If false, cases with missing values are dropped down the tree until a leaf is reached or a node for which the attribute is missing, and that node is used for prediction. If split = TRUE cases with missing attributes are split into fractional cases and dropped down each side of the split. The predicted values are averaged over the fractions to give the prediction.
}
  \item{nwts}{
weights for the newdata cases, used when predicting a tsp.tree.
}
  \item{eps}{
a lower bound for the probabilities, used if events of predicted probability zero occur in newdata when predicting a tree.
}
  \item{\dots}{
other arguments.
}
}

\author{
Xiaolin Yang, Han Liu
}

\examples{
library(tree)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
y=as.factor(y)
data=data.frame(y,x)
tr=tsp.tree(x,y)
predict(tr,data[1:10,])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
