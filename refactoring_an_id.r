# say you want to refactor an id based on ordering on some other parameter.

# for instance you have a datatable with sightings of that id
set.seed(311828578)

sight_df <- data.frame(
  id = sample(1:10, 100, replace = TRUE),
  date = rnorm(100),
  x = rnorm(100),
  y = rnorm(100)
)

# want to refactor the ids so they go from 1:length(unique(id)) and are sorted by the value of the mean x for each individual id
meanx <- tapply(sight_df$x, sight_df$id, mean)

# make a joy division
neworder <- order(meanx)

# apply the refactoring
sight_df$newid <- neworder[sight_df$id]

# check your work
order(tapply(sight_df$x, sight_df$newid, mean))
#  [1]  1  7  6  2  3  9  8  4  5 10


###
### uh oh what went wrong?
###

# you need to do the order of the order to get the new order!
neworder <- order(order(meanx))
sight_df$newid <- neworder[sight_df$id]

# check your work
order(tapply(sight_df$x, sight_df$newid, mean))
# [1]  1  2  3  4  5  6  7  8  9 10

# ok!



###
### an alternative using ave() -- what's that even do?
###

# bonus you can use aggregate instead of tapply to do this
meanx <- aggregate(x ~ id, sight_df, mean)

# match and copy it back in
sight_df$meanx <- mean_x$x[match(sight_df$id, meanx$id)]

# reorder (once this time)
sight_df <- sight_df[order(sight_df$meanx),]

sight_df$newid <- as.numeric(ave(
    paste(sight_df$meanx, sight_df$id),
    rep(1, nrow(sight_df)), # grouping variable all one group in this case
    FUN = function(x) match(x, unique(x))
))

#check your work
order(tapply(sight_df$x, sight_df$newid, mean))
