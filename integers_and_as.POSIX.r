# you might save your dates like this: %Y%m%d if you're afraid of excel ruining them
# if you read.table a csv like this, R will assume this column is an integer
testdate <- 20240225

# even though you specify the format, if testdate is an integer, as.POSIXct will
# ignore the specified format and fail silently.
as.POSIXct(testdate, format = '%Y%M%d', tz = 'utc')

# you'll have to cast your dates to character at some point
as.POSIXct(as.character(testdate), format = '%Y%m%d', tz = 'utc')

# that works no need for tibbles or lubridates or whatever.
