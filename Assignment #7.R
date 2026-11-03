getwd()

# Load the dataset
census <- read.csv("census.csv")

# Show the first rows
head(census)
     
# describe structure
str(census)

# BaTest generic functions
print(census)
summary(census)

# Select the first 12 states
census12 <- census[1:12, ]

# Plot census

plot(
    x = 1:nrow(census12),
    y = 1:nrow(census12),
        main = "First 12 Sates",
        xlab = "State",
        ylab = "State Count",
        pch = 19,
        col = "orange",
        xaxt = "n"
)
axis(
  1,
  at = 1:nrow(census12),
 labels = c("Alabama", "Alaska", "Arizona", "Arkansas",
  "California", "Colorado", "Connecticut", "Delaware",
  "Florida", "Georgia", "Hawaii", "Idaho"
  ),
  las = 2,
  cex.axis=0.8
)

# Create an S3 objecct 
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"
print(s3_obj)

# Create an S4 class and object 
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)
print(s4_obj)





