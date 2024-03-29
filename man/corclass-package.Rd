\name{corclass-package}
\alias{corclass-package}
\alias{corclass}
\docType{package}
\title{
Correlational Class Analysis package
}
\description{
This package implements the Correlational Class Analysis methodology described by Boutyline (under review).  
The correlational class analysis of a survey dataset produces a partition of the population into separate modules.  This is done in four steps:
\enumerate{
    \item Create a matrix G of absolute row correlations. This is the network adjacency matrix.
    \item Set statistically insignificant correlations to 0 to reduce noise. 
    \item Use igraph's leading.eigenvector.community to partition this network into modules.
    \item Return an object describing the resulting class assignments (as well as the separate data frames describing the individual modules.)
}
CCA substantially improves the accuracy of the Relational Class Analysis (RCA) algorithm proposed by Goldberg (2011). See Boutyline (under review) for details.
}
\details{
The main function is \code{\link{cca}}.  \code{\link{plot.cca}} plots the modules produced by \code{\link{cca}}.  Sample data can be accessed via data(cca.example).
}
\author{
Written and maintained by Andrei Boutyline, \email{andrei.boutyline@gmail.com}.
}
\references{
Boutyline, Andrei. 2017. "Improving the Measurement of Shared Cultural Schemas with Correlational Class Analysis: Theory and Method." Sociological Science 4:353-93. https://www.sociologicalscience.com/articles-v4-15-353/
}
\keyword{ package }
\seealso{
This package makes heavy use of \code{\link[igraph:aaa-igraph-package]{igraph}}.\cr
The CCA algorithm is an improvement of RCA \url{https://cran.r-project.org/package=RCA}
}
\examples{
    data(cca.example)
    res1 <- cca(cca.example) 
    plot(res1, 1) 
}
