
Assignment #11: Debugging and Defensive Programming in R
# Debugging and Defensive Programming in
# Background & Buggy Code

  tukey_multiple <- function(x) {
    outliers <- array(TRUE, dim = dim(x))
    for (j in 1:ncol(x)) {
      outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
    }
    outlier.vec <- vector("logical", length = nrow(x))
    for (i in 1:nrow(x)) {
      outlier.vec[i] <- all(outliers[i, ])
    }
    return(outlier.vec)
  }

# 1.Reproduce the Error
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# Run the function
tukey_multiple(test_mat)

# 2. Diagnose the Bug
# Answer:Using the logical AND operator (&&) within a loop can result in failure when it is used to 
combine two arguments intended to run independently. This occurs because && evaluates only the first 
element and returns a single TRUE/FALSE value, whereas the loop requires element‑wise comparison of all values

# 3. Fix the Code
# Corrected inside the loop:
outliers[, j] <- outliers[, j] &
tukey.outlier(x[, j])

# 4. Validate Your Fix
 corrected_tukey <- function(x) {
    outliers <- array(TRUE, dim = dim(x))
    for (j in seq_len(ncol(x))) {
      outliers[, j] <- outliers[, j] &
 tukey.outlier(x[, j])
    }
    outlier.vec <- logical(nrow(x))
    for (i in seq_len(nrow(x))) {
      outlier.vec[i] <- all(outliers[i, ])
    }
    outlier.vec
  }
corrected_tukey(test_mat)

# Verify if it returns a logical vector of length 10 without error
length(tukey.outlier(test_mat[, 1]))
nrow(test_mat)

## Display the original error code message:
 # Run the function
tukey_multiple(test_mat)
Error in outliers[, j] && tukey.outlier(x[, j]) : 
  'length = 10' in coercion to 'logical(1)',,
The && only checks the first element, yielding a single TRUE/FALSE.
Because outliers[, j] and tukey.outlier(x[, j]) are length‑10 vectors, 
the loop needs element‑wise comparison; use & instead.

# Corrected inside the loop:
outliers[, j] <- outliers[, j] &
+ tukey.outlier(x[, j])
Error: object 'outliers' not found, 
The error occurred because outliers was not found. 
Identifier outliers is defined inside the function and is not accessible outside,
so the line cannot run alone.

# Validate My Fix
corrected_tukey(test_mat)
Error in tukey.outlier(x[, j]) : could not find function "tukey.outlier"
The error happened because tukey.outlier() isn’t defined in the current R session. 
corrected_tukey() depends on it, so R can’t run until tukey.outlier() is loaded or defined.

# Verify if it returns a logical vector of length 10 without error
length(tukey.outlier(test_mat[, 1]))
Error in tukey.outlier(test_mat[, 1]) : 
could not find function "tukey.outlier" That happened because the function tukey.outlier() 
has not been defined or loaded in the current R session.

## The corrected code and its successful output:
# Background & Buggy Code
  tukey_multiple <- function(x) {
+     outliers <- array(TRUE, dim = dim(x))
+     for (j in 1:ncol(x)) {
+       outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
+     }
+     outlier.vec <- vector("logical", length = nrow(x))
+     for (i in 1:nrow(x)) {
+       outlier.vec[i] <- all(outliers[i, ])
+     }
+     return(outlier.vec)
+   }explain why it good

# 1.Reproduce the Error
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# 4. Validate Your Fix
>  corrected_tukey <- function(x) {
+     outliers <- array(TRUE, dim = dim(x))
+     for (j in seq_len(ncol(x))) {
+       outliers[, j] <- outliers[, j] &
+  tukey.outlier(x[, j])
+     }
+     outlier.vec <- logical(nrow(x))
+     for (i in seq_len(nrow(x))) {
+       outlier.vec[i] <- all(outliers[i, ])
+     }
+     outlier.vec
+   }







