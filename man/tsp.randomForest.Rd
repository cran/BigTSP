\name{tsp.randomForest}
\alias{tsp.randomForest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Classification with Random Forest based on Top Scoring Pairs
}
\description{
Classification with Random Forest based on Top Scoring Pairs
}
\usage{
tsp.randomForest(x, y = NULL, xtest = NULL, ytest = NULL, ntree = 500, type = "classification", mtry = if (!is.null(y) && !is.factor(y)) max(floor(ncol(x)/3), 1) else floor(sqrt(ncol(x))), replace = TRUE, classwt = NULL, cutoff, strata, sampsize = if (replace) nrow(x) else ceiling(0.632 * nrow(x)), nodesize = if (!is.null(y) && !is.factor(y)) 5 else 1, maxnodes = NULL, importance = FALSE, localImp = FALSE, nPerm = 1, proximity = FALSE, oob.prox = proximity, norm.votes = TRUE, do.trace = FALSE, keep.forest = !is.null(y) && is.null(xtest), keep.inbag = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
a data frame or a matrix of predictors, or a formula describing the model to be fitted
}
  \item{y}{
A response vector. If omitted, tsp.randomForest will run in unsupervised mode.
}
  \item{xtest}{
a data frame or matrix (like x) containing predictors for the test set.
}
  \item{ytest}{
response for the test set.
}
  \item{ntree}{
Number of trees to grow. 
}
  \item{type}{
turn on the ''classification" mode in ''randomForest".
}
  \item{mtry}{
Number of top scoring pairs randomly sampled as candidates at each split.
}
  \item{replace}{
Should sampling of cases be done with or without replacement?
}
  \item{classwt}{
Priors of the classes. Need not add up to one. Ignored for regression.
}
  \item{cutoff}{
(Classification only) A vector of length equal to number of classes. The \code{'winning'} class for an observation is the one with the maximum ratio of proportion of votes to cutoff. Default is \code{1/k} where k is the number of classes (i.e., majority vote wins).
}
  \item{strata}{
A (factor) variable that is used for stratified sampling.
}
  \item{sampsize}{
Size(s) of sample to draw. For classification, if sampsize is a vector of the length the number of strata, then sampling is stratified by strata, and the elements of sampsize indicate the numbers to be drawn from the strata.
}
  \item{nodesize}{
Minimum size of terminal nodes. Setting this number larger causes smaller trees to be grown (and thus take less time).
}
  \item{maxnodes}{
Maximum number of terminal nodes trees in the forest can have.
}
  \item{importance}{
Should importance of top scoring pairs be assessed?
}
  \item{localImp}{
Should casewise importance measure be computed?
}
  \item{nPerm}{
Number of times the OOB data are permuted per tree for assessing top scoring pair importance.
}
  \item{proximity}{
Should proximity measure among the rows be calculated?
}
  \item{oob.prox}{
Should proximity be calculated only on ''out-of-bag" data?
}
  \item{norm.votes}{
If TRUE (default), the final result of votes are expressed as fractions. If FALSE, raw vote counts are returned (useful for combining results from different runs). Ignored for regression.
}
  \item{do.trace}{
If set to TRUE, give a more verbose output as randomForest is run. If set to some integer, then running output is printed for every do.trace trees.
}
  \item{keep.forest}{
If set to FALSE, the forest will not be retained in the output object. If xtest is given, defaults to FALSE.
}
 
  \item{keep.inbag}{
Should an n by ntree matrix be returned that keeps track of which samples are ''in-bag" in which trees (but not how many times, if sampling with replacement)
}
  \item{\dots}{
Additional arguments.
}
}

\value{
\item{call}{the original call to \code{randomForest}}
  \item{type}{one of \code{regression}, \code{classification}, or
    \code{unsupervised}.}
  \item{predicted}{the predicted values of the input data based on
    out-of-bag samples.}
  \item{importance}{a matrix with \code{nclass} + 2 (for classification)
    or two (for regression) columns.  For classification, the first
    \code{nclass} columns are the class-specific measures computed as
    mean descrease in accuracy.  The \code{nclass} + 1st column is the
    mean descrease in accuracy over all classes.  The last column is the
    mean decrease in Gini index.  For Regression, the first column is
    the mean decrease in accuracy and the second the mean decrease in MSE.
    If \code{importance=FALSE}, the last measure is still returned as a
    vector.}
  \item{importanceSD}{The ``standard errors'' of the permutation-based
    importance measure.  For classification, a \code{p} by \code{nclass
      + 1} matrix corresponding to the first \code{nclass + 1} columns
    of the importance matrix.  For regression, a length \code{p} vector.}
  \item{localImp}{a p by n matrix containing the casewise importance
    measures, the [i,j] element of which is the importance of i-th
    variable on the j-th case. \code{NULL} if \code{localImp=FALSE}.}
  \item{ntree}{number of trees grown.}
  \item{mtry}{number of predictors sampled for spliting at each node.}
  \item{forest}{(a list that contains the entire forest; \code{NULL} if
    \code{randomForest} is run in unsupervised mode or if
    \code{keep.forest=FALSE}.}
  \item{err.rate}{(classification only) vector error rates of the
    prediction on the input data, the i-th element being the (OOB) error rate
    for all trees up to the i-th.}
  \item{confusion}{(classification only) the confusion matrix of the
    prediction (based on OOB data).}
  \item{votes}{(classification only) a matrix with one row for each
    input data point and one column for each class, giving the fraction
    or number of (OOB) `votes' from the random forest.}
  \item{oob.times}{number of times cases are `out-of-bag' (and thus used
    in computing OOB error estimate)}
  \item{proximity}{if \code{proximity=TRUE} when
    \code{randomForest} is called, a matrix of proximity measures among
    the input (based on the frequency that pairs of data points are in
    the same terminal nodes).}

  \item{mse}{(regression only) vector of mean square errors: sum of squared
    residuals divided by \code{n}.}
  \item{rsq}{(regression only) ``pseudo R-squared'': 1 - \code{mse} /
    Var(y).}
  \item{test}{if test set is given (through the \code{xtest} or additionally
  \code{ytest} arguments), this component is a list which contains the
  corresponding \code{predicted}, \code{err.rate}, \code{confusion},
  \code{votes} (for classification) or \code{predicted}, \code{mse} and
  \code{rsq} (for regression) for the test set.  If
  \code{proximity=TRUE}, there is also a component, \code{proximity},
  which contains the proximity among the test set as well as proximity
  between test and training data.}

}
\references{
Breiman, L. (2001), \emph{Random Forests, Machine Learning}
Breiman, L. (2002), \emph{"Manual On Setting Up, Using, And Understanding Random Forests V3.1"}, \url{http://oz.berkeley.edu/users/breiman/Using_random_forests_V3.1.pdf.}
}
\author{
Xiaolin Yang, Han Liu
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{predict.tsp.randomForest}
}
\examples{
library(randomForest)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
y=as.factor(y)
fit=tsp.randomForest(x,y)
predict(fit,x[1:10,])
plot(fit)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
