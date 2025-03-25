## don't forget about na.rm with any!

# makes sense
x = c(TRUE, FALSE, NA)
any(x)
# TRUE

# but
x = c(FALSE, FALSE, NA)
any(x)
# NA

# use
any(x, na.rm = TRUE)
# FALSE
