# we have some metadata on items in a data.frame
metadata <- data.frame(id = LETTERS, x1 = rnorm(length(LETTERS)))

# we have some survey data on the same items in a data.frame
surveydata <- data.frame(id = sample(LETTERS, 5), surveyno = 1:5, x2 = rnorm(5))

# it's in a particular order
order(surveydata$surveyno)

# we do a merge to bring in some metadata to the surveydata
surveydata_merged <- merge(surveydata, metadata)

# uh oh did the order change?
order(surveydata_merged$surveyno)

# the default is to sort in merge.data.frame!
surveydata_merged2 <- merge(surveydata, metadata, sort = FALSE)

# that's better
order(surveydata_merged2$surveyno)
