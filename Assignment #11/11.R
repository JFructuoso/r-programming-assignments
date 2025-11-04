#helper fuction
tukey.outlier <- function(v) {
  # Ensure input is numeric
  if (!is.numeric(v)) {
    stop("Input must be a numeric vector.")
  }
  
  # Calculate quartiles and IQR (handling NAs)
  Q1 <- quantile(v, 0.25, na.rm = TRUE)
  Q3 <- quantile(v, 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  
  # Define outlier bounds
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  
  # Return a logical vector (TRUE if it's an outlier)
  return(v < lower_bound | v > upper_bound)
}
# Corrected function snippet
corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    # THE FIX: Use & for element-wise comparison
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  
  outlier.vec <- logical(nrow(x)) 
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# Run the validation
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
corrected_result <- corrected_tukey(test_mat)

print(corrected_result)

