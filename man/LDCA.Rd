\name{LDCA}
\alias{LDCA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Linear Discriminant Analysis based on Top Scoring Pair
}
\description{
Linear Discriminant Analysis based on Top Scoring Pair
}
\usage{
LDCA(X,y,nlambda=100,lambda=NULL,threshold=1e-07)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{input matrix, of dimension nobs x nvars; each row is an
  observation vector.
}
  \item{y}{response variable.
}
  \item{nlambda}{
  The number of \code{lambda} values - default is 100.
  }
  \item{lambda}{user specified lambda sequence}
  \item{threshold}{
    Convergence threshold for coordinate descent. A parameter from "glmnet" package. Defaults value is \code{1E-7}.
  }
}
\value{
%%  ~Describe the value returned

An object with S3 class \code{"LDCA","glmnet" }
  \item{call}{the call that produced this object}
  \item{a0}{Intercept sequence of length \code{length(lambda)}}
  \item{beta}{For \code{"elnet"} and \code{"lognet"} models, a \code{nvars x
      length(lambda)} matrix of coefficients, stored in sparse column
    format (\code{"CsparseMatrix"}). For \code{"multnet"}, a list of \code{nc} such
    matrices, one for each class.}
  \item{lambda}{The actual sequence of \code{lambda} values used}
  \item{dev.ratio}{The fraction of (null) deviance explained (for \code{"elnet"}, this
      is the R-square). The deviance calculations incorporate weights if
  present in the model. The deviance is defined to be 2*(loglike_sat -
  loglike), where loglike_sat is the log-likelihood for the saturated
  model (a model with a free parameter per observation). Hence dev.ratio=1-dev/nulldev.}
    \item{nulldev}{Null deviance (per observation). This is defined to
  be  2*(loglike_sat -loglike(Null)); The NULL model refers to the
  intercept model, except for the Cox, where it is the 0 model.}
  \item{df}{The number of nonzero coefficients for each value of
    \code{lambda}. For \code{"multnet"}, this is the number of variables
    with a nonzero coefficient for \emph{any} class.}

  \item{dim}{dimension of coefficient matrix (ices)}
  \item{nobs}{number of observations}
  \item{npasses}{total passes over the data summed over all lambda
    values}
  \item{offset}{a logical variable indicating whether an offset was included in the model}
  \item{jerr}{error flag, for warnings and errors (largely for internal debugging).}
}
\references{
Geman, D., dAvignon, C.: Classifying gene expression profiles from pairwise mRNA comparisons. Statistical Applications in Genetics and Molecular Biology, 3(1):19 (2007)
}
\author{
Xiaolin Yang, Han Liu
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{summary.LDCA},\code{print.LDCA},\code{predict.LDCA},\code{plot.LDCA}
}
\examples{
library(glmnet)
x=matrix(rnorm(100*20),100,20)
y=rbinom(100,1,0.5)
fit=LDCA(x,y)
print(fit)
predict(fit,newx=x[1:10,]) # make predictions
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
