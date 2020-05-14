# be careful when incrementing parts of matrices

mat <- matrix(0, 5, 5)

# say we want to increment this dyad symmetrically:
# 1 and 3 so we want mat[1, 3] and mat[3, 1] to increase by 1
# you might do
a <- c(1, 3)
b <- c(3, 1)
mat[a, b] <- mat[a, b] + 1

# but this is bad because you also incrememnt 1 and 3 on the diag

# so instead can do
a <- c(1, 3)
b <- c(3, 1)
dese <- (b-1)*nrow(mat) + a
mat[dese] <- mat[dese] + 1
