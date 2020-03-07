# don't forget the iterator
nsim <- 100
counts <- vector()

for(i in 1:nsim) {
  counts[1] <- sum(rpois(100, 10))
}

# oops where'd the counts go?
hist(counts)



### here's another one



# i have a nice for loop it works
for(i in 1:nsim) {
  print(i)
}

# now I make it a while loop for some other reason
i <- 1
while(i <= nsim) {
  print(i)
}

# oops why is the computer hanging?
