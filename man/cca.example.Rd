\name{cca.example}
\alias{cca.example}
\docType{data}
\title{
Sample data for Correlational Class Analysis.
}
\description{
A randomly generated sample dataset for correlational class analysis, created using the approach described in Boutyline (under review). 
rownames(cca.example) contain the true schematic class membership for each row.  Every row belonging to one schematic class was created
from noisy linear transformations of the same vector.  
}
\usage{data(cca.example)}
\format{
  The format is:
 num [1:754, 1:10] 4 7 4 7 4 4 7 3 9 8 ...
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:754] "1" "1" "1" "1" ...
  ..$ : NULL
}
\source{
Boutyline, Andrei. Under review. "Correlational Class Analysis Draws a More Accurate Map (Comment on Goldberg)." 
Working paper available from \url{www.ocf.berkeley.edu/~andrei}.
}
\examples{
data(cca.example)
res1 <- cca(cca.example)
}
\keyword{datasets}
