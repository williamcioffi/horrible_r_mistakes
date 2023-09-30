# this is a reasonable way to store dates
somedates <- as.numeric(as.POSIXct(c(
  "2019-01-02 01:02:03",
  "2019-01-03 04:05:06"
)))

# put it in a data frame
df <- data.frame(d1 = somedates[1], d2 = somedates[2])

# do some math on the dates
df$d1 + df$d2
# this is fine

# save it for later
write.table(df, file = "00_data/somedates_df.csv", sep = ',', row.names = FALSE)

# reload it later
df2 <- read.table("00_data/somedates_df.csv", header = TRUE, sep = ',')

# do the same math
df2$d1 + df2$d2

## [1] NA
## Warning message:
##  In df2$d1 + df2$d2 : NAs produced by integer overflow

# this is not fine? but can recover:
sum(df2$d1, df2$d2)
# this is fine

# what happened?

class(df$d1)  # numeric
class(df2$d1) # integer

# oops... a good guess from data.frame but don't forget to double check!
