\name{print.cca}
\alias{print.cca}
\title{
Print description of CCA results.
}
\description{
Prints a concise description of CCA results, including module membership counts.  Reports if any of the modules are degenerate.
}
\usage{
\method{print}{cca}(x, ...)
}
\arguments{
  \item{x}{
The cca object returned by \code{\link{cca}}.
}
  \item{...}{
Unused.
}
}
\author{
Andrei Boutyline, \email{andrei.boutyline@gmail.com}
}

\seealso{
\code{\link{plot.cca}}, \code{\link{cca}}
}
\examples{
    data(cca.example)
    res1 <- cca(cca.example)
    print(res1)
}