#Morgyn Joubert, 02/14/2024, ALY 6015: Intermediate Analytics
cat("\014") # clears console
rm(list = ls()) # clears global environment
try(dev.off(dev.list()["RStudioGD"]), silent = TRUE) # clears plots
try(p_unload(p_loaded(), character.only = TRUE), silent = TRUE) #clears packages
options(scipen = 100) # disables scientific notion for entire R session
# Load necessary libraries
library(readr)  # For reading CSV files
library(dplyr)  # For data manipulation
library(ggplot2)  # For data visualization
# Load the dataset
movie_dataset <- read_csv("/Users/m.joubert/Documents/Final Project: Initial Analysis Report - Joubert/movie_dataset.csv")
# Explore the structure of the dataset
str(movie_dataset)
# Summary statistics
summary(movie_dataset)
# Histogram of budget
hist(movie_dataset$budget, breaks = 20, col = "skyblue", main = "Distribution of Budget", xlab = "Budget (in millions)")
# Scatter plot of budget vs. revenue
plot(movie_dataset$budget, movie_dataset$revenue, 
     main = "Budget vs. Revenue", 
     xlab = "Budget (in millions)", 
     ylab = "Revenue (in millions)", 
     col = "darkred")
# Linear regression model
lm_model <- lm(revenue ~ budget, data = movie_dataset)
# Summary of the regression model
summary(lm_model)
# Load necessary libraries
library(readr)
# Load the dataset
movie_dataset <- read_csv("/Users/m.joubert/Documents/Final Project - Draft - Joubert/movie_dataset.csv")
# Check the structure of the dataset
str(movie_dataset)
# Calculate Pearson correlation coefficient between budget and popularity
correlation <- cor(movie_dataset$budget, movie_dataset$popularity)
# Print the correlation coefficient
correlation
# Fit a linear regression model
lm_model <- lm(popularity ~ budget, data = movie_dataset)
# Summary of the regression model
summary(lm_model)
# Generate predictions using the regression model
predictions <- predict(lm_model, newdata = movie_dataset)
# Print the first few predicted popularity values
head(predictions)
# Load necessary libraries
library(ggplot2)
# Sample a smaller subset of the data to avoid over-dense plotting
set.seed(123)  # Set seed for reproducibility
sampled_data <- movie_dataset[sample(nrow(movie_dataset), 500), ]
# Create a scatter plot of budget vs. popularity with the smaller sampled data
plot <- ggplot(sampled_data, aes(x = budget, y = popularity)) +
  geom_point(color = "blue", alpha = 0.5) +  # Add transparency to points
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot: Movie Budget vs. Popularity (Smaller Sampled Data)",
       x = "Budget (in millions)",
       y = "Popularity") +
  theme_minimal()
# Save the plot as a PDF file
ggsave("scatter_plot_budget_vs_popularity.pdf", plot, width = 10, height = 7)
