# expand.grid stringsAsFactors defaults to TRUE

# remember when R version 4 made default.stringsAsFactors() == FALSE?
default.stringsAsFactors()

# this works in data.frame
args(data.frame)

# this works in read.table
args(read.table)

# whoops hard coded to TRUE in expand.grid
args(expand.grid)

# be careful.
grd <- expand.grid(LETTERS[1:2], LETTERS[1:2])

# it's a factor. Yuck!
class(grd[, 1])

# you probably want
grd2 <- expand.grid(LETTERS[1:2], LETTERS[1:2], stringsAsFactors = FALSE)

# much better
class(grd2[, 1])
