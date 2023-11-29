# read in a file (text) with a col of hex value

dat1 <- read.table(text =
  "id,hex
  1,2435
  2,45E1
  3,444F",
  header = TRUE,
  sep = ',', stringsAsFactors = FALSE
)

dat1

#   id  hex
# 1  1 2435
# 2  2 45E1
# 3  3 444F

# works great!
# but what if it is just the first 2 rows?

dat2 <- read.table(text =
  "id,hex
  1,2435
  2,45E1",
  header = TRUE,
  sep = ',', stringsAsFactors = FALSE
)

dat2
  
#   id  hex
# 1  1 2435
# 2  2  450

# uh oh what happened? read.delim guessed wrong...

class(dat1$hex) # character
class(dat2$hex) # numeric

# fix it with this:

dat3 <-  read.table(text =
  "id,hex
  1,2435
  2,45E1",
  header = TRUE,
  sep = ',', stringsAsFactors = FALSE,
  colClasses = c("numeric", "character")
)

dat3 == dat1[1:2, ]

# works!

# don't talk to be about tibbles, I don't want to hear it.
