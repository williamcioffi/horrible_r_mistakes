# the for iterator range is not re-eval'd
# say i want to do something stupid like
# insert missing numbers (in order) to x
x <- c(1, 3, 4, 5, 7)

for(i in 2:length(x)) {
  if(x[i] - x[i-1] > 1) {
    x <- c(x[1:(i-1)], x[i]+1, x[i:length(x)])
  }
}

# oops this stops short because length(x) is only
# eval'd at the beginning and doesn't grow

# one solution use a while loop
# is there a smarter way to do this?
x <- c(1, 3, 4, 5, 7)

i <- 2
while(i <= length(x)) {
  if(x[i] - x[i-1] > 1) {
    x <- c(x[1:(i-1)], x[i-1]+1, x[i:length(x)])
  }
  
  i <- i + 1
} 
