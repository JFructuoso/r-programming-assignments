#1

A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

print(A)
print(B)

print(A + B)
print(A - B)

#2
D <- diag(c(4, 1, 2, 3))
print(D)

#3

C <- matrix(0, nrow = 5, ncol = 5)
diag(C) <- 3
C[1, 2:5] <- 1
C[2:5, 1] <- 2
print(C)
