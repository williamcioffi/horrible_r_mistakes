# index matric by rownames (or colnames)

mat <- matrix(1:25, 5, 5)

# if you give the rows names you can call by names in a matrix
rownames(mat) <- LETTERS[1:5]
mat['A', ]
searchrow <- 'A'
mat[searchrow, ]

# but be careful if your rownames are numeric (and not sorted)
rownames(mat) <- 5:1

# want row called 5 (the first row)
# this is fine
searchrow <- 5
mat[rownames(mat) == searchrow, ]

# this is not fine
mat[searchrow, ]

# this is fine
mat[as.character(searchrow), ]
