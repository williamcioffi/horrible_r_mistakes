# don't forget the iterator
nsim <- 100
counts <- vector()

for(i in 1:nsim) {
  counts[1] <- sum(rpois(100, 10))
}

# oops where'd the counts go?
hist(counts)
