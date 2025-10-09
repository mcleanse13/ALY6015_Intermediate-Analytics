library(dplyr)
library(ggplot2)
library(corrplot)
library(RColorBrewer)
library(car)

#Question 1
#Importing the dataset
ames <- read.csv("AmesHousing.csv", header=TRUE)
ames

#Question 2
#Summary statistics of the data set
summary(ames)
View(ames)
dim(ames)
head(ames)
tail(ames)
str(ames)
class(ames)
range(ames$Year.Built)
range(ames$SalePrice)

#Question 3
# Check for missing values
missing_values <- colSums(is.na(ames))

# Print the columns with missing values
print(missing_values[missing_values > 0])

# Impute missing values with the mean of each column
ames1 <- ames

# Loop through columns with missing values
for (col in names(ames)[missing_values > 0]) {
  # Calculate the mean excluding missing values
  mean_value <- mean(ames[[col]], na.rm = TRUE)
  
  # Replace missing values with the mean
  ames1[[col]][is.na(ames[[col]])] <- mean_value
}

# Display the first few rows of the imputed dataset
head(ames1)

#Question 4
# Identify numeric columns
numeric_cols <- sapply(ames1, is.numeric)

# Use the cor() function to compute the correlation matrix for numeric values
cor_matrix <- cor(ames1[, numeric_cols])

# Print the correlation matrix
print(cor_matrix)

#Question 5
# Customize the correlation plot
corrplot(cor_matrix, method = "color", type = "upper", order = "original", tl.col = "black", tl.srt = 90)

# Add a title
title("Correlation Matrix")

#Question 6
#I couldn't get the code to run, trying to figure out where I messed up!
# Calculate correlations between SalePrice and X variables
set.seed(123)
correlations <- cor(cor_matrix)

# Find the variable with the highest correlation
highest_corr_variable <- names(which.max(correlations["SalePrice", ]))

# Find the variable with the lowest correlation
lowest_corr_variable <- names(which.min(correlations["SalePrice", ]))

# Find the variable with the correlation closest to 0.5
closest_corr_variable <- names(which.min(abs(correlations["SalePrice", ] - 0.5)))

# Create scatter plots
par(mfrow = c(1, 3), mar = c(4, 4, 2, 1))

# Scatter plot for the variable with the highest correlation
plot(cor_matrix ~ SalePrice, cor_matrix[[highest_corr_variable]], xlim = c(-1, 1), 
     main = paste("SalePrice vs.", highest_corr_variable, "Correlation =", round(correlations["SalePrice", highest_corr_variable], 2)),
     xlab = "SalePrice", ylab = highest_corr_variable, col = "blue")

# Scatter plot for the variable with the lowest correlation
plot(cor_matrix ~ SalePrice, cor_matrix[[lowest_corr_variable]], 
     main = paste("SalePrice vs.", lowest_corr_variable, "Correlation =", round(correlations["SalePrice", lowest_corr_variable], 2)),
     xlab = "SalePrice", ylab = lowest_corr_variable, col = "red")

# Scatter plot for the variable with the correlation closest to 0.5
plot(cor_matrix ~ SalePrice, cor_matrix[[closest_corr_variable]], 
     main = paste("SalePrice vs.", closest_corr_variable, "Correlation =", round(correlations["SalePrice", closest_corr_variable], 2)),
     xlab = "SalePrice", ylab = closest_corr_variable, col = "green")

#Question 7
# Fit a multiple linear regression model
model <- lm(SalePrice ~ Lot.Frontage + Overall.Qual + Year.Built + MS.SubClass, data = ames1)

# Display the summary of the regression model
summary(model)

#Question 8 -  Report the model in equation form and interpret each coefficient of the model in the 
#context of this problem.

#Question 9
plot(model)

#Question 10
#Check for VIF in regression model
library(car)
vif(model)

#Question 11 - Check for outliers in model
outlierTest(model = model)
#Leverage values in regression model
hat_values <- hatvalues(model)

# Create a hat plot
plot(hat_values, pch = 19, main = "Hat Plot", xlab = "Observation", ylab = "Leverage")

# Add a horizontal line at the typical threshold for high leverage
abline(h = 2 * nobs(model)/length(hat_values), col = "red", lty = 2)

#Question 12 -  Attempt to correct any issues that you have discovered in your model. 
#Did your changes improve the model, why or why not?

#Question 13
# Install and load the leaps package
install.packages("leaps")
library(leaps)

# Fit all possible models and choose the best subset
all_subsets <- regsubsets(SalePrice ~ Lot.Frontage + Overall.Qual + Year.Built, data = ames1, method = "exhaustive")

# Choose the best model based on BIC (you can use AIC or adjusted R^2 as well)
best_model <- which.min(summary(all_subsets)$adjr2)

# Display the best model
summary(all_subsets)$which[best_model, ]

# Fit the preferred model
preferred_model <- lm(SalePrice ~ Lot.Frontage + Overall.Qual + Year.Built, data = ames1)
summary(preferred_model)
plot(preferred_model)

#Question 14 -  Compare the preferred model from step 13 with your model from step 12. 
#How do they differ? Which model do you prefer and why?
  
