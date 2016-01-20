\name{cca}
\alias{cca}
\title{
Main function for CCA.
}
\description{
    Perform a correlational class analysis of the data, resulting in a partition of the data into separate modules.  This consists of four steps:
    \enumerate{
    \item Create a matrix G of absolute row correlations. This is the network adjacency matrix.
    \item Set statistically insignificant correlations to 0 to reduce noise. 
    \item Use igraph's leading.eigenvector.community to partition this network into modules.
    \item Return an object describing the resulting class assignments (as well as the separate data frames describing the individual modules.)
    }
}
\usage{
cca(dtf, filter.significance = TRUE, filter.value = 0.01, 
    zero.action = c("drop", "ownclass"), verbose = TRUE)
}

\arguments{
  \item{dtf}{
    The data frame containing the variables of interest.
}
  \item{filter.significance}{
Significance filtering sets "insignificant" ties to 0 to decrease noise and increase stability.  Simulation results show that this greatly increases accuracy in many settings. Set filter.significance = FALSE to disable this.
}
  \item{filter.value}{
Minimum significance cutoff.  Absolute row correlations below this value will be set to 0. 
}
  \item{zero.action}{
    What to do with 0-variance rows before partitioning the graph. 
            If zero.action is "drop", CCA drop rows with 0 variance from the analyses (default).  If zero.action is "ownclass", the correlations between 0-variance rows and all other rows
            is set to 0, and the correlations between all pairs of 0-var rows are set to 1. This effectively creates a "zero class".
}
  \item{verbose}{
    Whether to print details of what CCA is doing to the screen.
}
}
\value{
\item{membership}{The class assignments produced by CCA.}
\item{cormat}{The row correlation matrix that was partitioned by CCA.  It has a "dtf" attribute which holds the dataframe.  Note that, if 0-variance were dropped, they will be excluded from the dataframe as well as the correlation matrix. The "zeros" attribute which holds the indexes of the dropped rows.}
\item{modules}{For convenience, the dataframe is separated into the modules found by the algorithm. A separate dataframe for each module i can be found in modules[[i]]$dtf.  The matrix of column correlations are in modules[[i]]$cormat.  modules[[i]]$degenerate indicates whether this module contains undefined.  Note that these modules can be plotted via the S3 plot method.  See example below.}
}
\references{
Boutyline, Andrei. Under review. "Correlational Class Analysis Draws a More Accurate Map (Comment on Goldberg)." 
Working paper available from \url{www.ocf.berkeley.edu/~andrei}.
}
\author{
Andrei Boutyline, \email{andrei.boutyline@gmail.com}.
}

\seealso{
\code{\link{plot.cca}}
}
\examples{
    data(cca.example)
    res1 <- cca(cca.example) # with igraph 0.7, this should find 3 classes of sizes 218 391 144.  
    plot(res1, 1) # plot them 
    plot(res1, 2)
    plot(res1, 3)

    print (round(res1$modules[[1]]$cormat, 2)) # examine the correlation matrix for the 1st module
    print (summary(res1$modules[[1]]$dtf)) # look at its variable ranges
    plot(res1, 1, bw = TRUE) # Plot it again in a more journal-friendly format.
    
    # now let's try setting the filter value too high
    res2 <- cca(cca.example, filter.value = 0.001) 
    # With igraph 0.7, the above now finds 17 classes 
    #    of sizes 216 1 1 371 1 1 1 1 1 1 1 1 11 141 1 1 2 
    # The small isolate classes can either be dropped manually, or by increasing filter.value 

}