\name{tsp.tree}
\alias{tsp.tree}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fit a Classification Tree based on Top Scoring Pairs.
}
\description{
Fit a Classification Tree based on Top Scoring Pairs.
}
\usage{
tsp.tree(X, response, control = tree.control(dim(X)[1], ...), method = "recursive.partition", split = c("deviance", "gini"), x = FALSE, y = TRUE, wts = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
input matrix, of dimension nobs x nvars, each row is an
  observation vector.
}
  \item{response}{
response variable.
}
  \item{control}{
A list as returned by \code{tree.control}.
}
  \item{method}{
character string giving the method to use. The only other useful value is \code{"model.frame"}.
}
  \item{split}{
Splitting criterion to use.
}
  \item{x}{
logical. If true, the matrix of variables for each case is returned.
}
  \item{y}{
logical. If true, the response variable is returned.
}
  \item{wts}{
logical. If true, the weights are returned.
}
  \item{\dots}{
Additional arguments
}
}

\value{
\item{frame}{A data frame with a row for each node, and row.names giving the node numbers. The columns include var, the variable used at the split (or \code{"<leaf>"} for a terminal node), n, the \code{(weighted)} number of cases reaching that node, dev the deviance of the node, yval, the fitted value at the node (the mean for regression trees, a majority class for classification trees) and split, a two-column matrix of the labels for the left and right splits at the node. Classification trees also have yprob, a matrix of fitted probabilities for each response level.}
\item{where}{An integer vector giving the row number of the frame detailing the node to which each case is assigned.}
\item{terms}{The terms of the formula.}
\item{call}{The matched call to Tree.}
\item{model}{If \code{model = TRUE}, the model frame.}
\item{x}{If \code{x = TRUE}, the model matrix.}
\item{y}{If \code{y = TRUE}, the response.}
\item{wts}{If \code{wts = TRUE}, the weights.}
}
\references{
Czajkowski,M., Kretowski, M. (2011) 
 \emph{Top scoring pair decision tree for gene expression data analysis.} Advances in experimental medicine and biology

Breiman L., Friedman J. H., Olshen R. A., and  Stone,  C. J. (1984)
  \emph{Classification  and Regression Trees.}  Wadsworth.

  Ripley, B. D. (1996)
  \emph{Pattern Recognition and Neural Networks.}
  Cambridge University Press, Cambridge. Chapter 7.
}
\author{
Xiaolin Yang, Han Liu
}

\seealso{
\code{\link{predict.tsp.tree}}
}
\examples{
library(tree)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
y=as.factor(y)
data=data.frame(y,x)
tr=tsp.tree(x,y)
predict(tr,data[1:10,])
plot(tr)
text(tr)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

