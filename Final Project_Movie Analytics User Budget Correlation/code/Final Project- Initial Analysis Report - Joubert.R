#Morgyn Joubert, 02/4/2024, ALY 6015: Intermediate Analytics
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
