# set.seed is "global"

set.seed(1)
rnorm(5)

badfun <- function() set.seed(1)

badfun()
rnorm(5)