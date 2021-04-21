# be careful with Date in data.frame

# create some dates using Date with NAs
dates <- as.Date(c(NA, NA, '1968-10-16', NA, NA))

# put it into a data.frame
dat <- data.frame(
  id = 1:5,
  dates = dates
)

# there are some NAs
is.na(dat$dates)

# you might do some math and change a date
otherdates <- c()
dat$dates[1] <- max(otherdates) # returns -Inf

# looks like an NA
dat

# looks like an NA
dat$dates[1]

# isn't an NA?
is.na(dat$dates)

# is still -Inf whoops
unclass(dat$dates)
