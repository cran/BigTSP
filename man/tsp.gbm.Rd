\name{tsp.gbm}
\alias{tsp.gbm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fits generalized boosted logistic regression models based on Top Scoring Pairs.
}
\description{
Fits generalized boosted logistic regression models based on Top Scoring Pairs.
}
\usage{
tsp.gbm(x, y, offset = NULL, misc = NULL, distribution = "bernoulli", w = NULL, var.monotone = NULL, n.trees = 100, interaction.depth = 1, n.minobsinnode = 10, shrinkage = 0.001, bag.fraction = 0.5, train.fraction = 1, keep.data = TRUE, verbose = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{input matrix, of dimension nobs x nvars; each row is an
  observation vector.
}
  \item{y}{
response variable.
}
  \item{offset}{
a vector of values for the offset
}
  \item{misc}{
is an R object that is simply passed on to the gbm engine. (refer to "gbm.fit" function in the "gbm" package)
}
  \item{distribution}{
A character string specifying the name of the distribution to use or a list with a component. The default value is "bernoulli" for logistic regression.
}
  \item{w}{
w is a vector of weights of the same length as the y.
}
  \item{var.monotone}{
an optional vector, the same length as the number of predictors, indicating which variables have a monotone increasing (+1), decreasing (-1), or arbitrary (0) relationship with the outcome.
}
  \item{n.trees}{
the total number of trees to fit. This is equivalent to the number of iterations and the number of basis functions in the additive expansion.
}
  \item{interaction.depth}{
The maximum depth of variable interactions. 1 implies an additive model, 2 implies a model with up to 2-way interactions, etc.
}
  \item{n.minobsinnode}{
minimum number of observations in the trees terminal nodes. Note that this is the actual number of observations not the total weight.
}
  \item{shrinkage}{
a shrinkage parameter applied to each tree in the expansion. Also known as the learning rate or step-size reduction.
}
  \item{bag.fraction}{
the fraction of the training set observations randomly selected to propose the next tree in the expansion.
}
  \item{train.fraction}{
The first train.fraction * nrows(data) observations are used to fit the gbm and the remainder are used for computing out-of-sample estimates of the loss function.
}
  \item{keep.data}{
a logical variable indicating whether to keep the data and an index of the data stored with the object.
}
  \item{verbose}{
If TRUE, tsp.gbm will print out progress and performance indicators.
}
}

\value{
See "gbm" package for returned values
}
\references{
See references for the "gbm" package.
}
\author{
Xiaolin Yang, Han Liu
}

\seealso{
\code{\link{predict.tsp.gbm}}
}
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
