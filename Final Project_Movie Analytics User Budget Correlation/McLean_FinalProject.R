#ALY 6015 Final Project - Movies Dataset (Sean McLean & Morgyn Joubert)

#Loading necessary libraries
library(readr)
library(dplyr)
library(ggplot2)
library(caret)

#Importing the dataset
movie_dataset <- read.csv("movie_dataset.csv", header = TRUE)
movie_dataset

#Summary statistics of the dataset
summary(movie_dataset)
View(movie_dataset)

#Remove all observations with 'NA' in the 'runtime' variable
dataset <- movie_dataset[complete.cases(movie_dataset$runtime), ]

#Display the modified dataset
summary(dataset)

#Perform correlation analysis
correlation_matrix <- cor(dataset[c("vote_average", "vote_count", "popularity", "id", "runtime", "revenue")])
correlation_matrix

# Reshape the correlation matrix to long format for heatmap
library(tidyr)
cor_long <- as.data.frame(as.table(correlation_matrix))
names(cor_long) <- c("Var1", "Var2", "Correlation")

# Create a heatmap using ggplot2
heatmap_plot <- ggplot(data = cor_long, aes(x = Var1, y = Var2)) +
  geom_tile(aes(fill = Correlation), color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) + # Adjust color scale
  labs(title = "Movie/User Correlation Heatmap",
       x = "Variables",
       y = "Variables") +
  theme_minimal()
print(heatmap_plot)

#Create a new variable from dataset for sampling
movies <- dataset %>%
  select(vote_average, vote_count, popularity, runtime, revenue)
summary(movies)

# Split the dataset into training and testing sets
set.seed(456)
trainIndex <- createDataPartition(movies$vote_count, p = 0.8, list = FALSE)
training_set <- movies[trainIndex, ]
testing_set <- movies[-trainIndex, ]

# Create a linear regression model
model <- lm(vote_count ~ ., data = training_set)
model

# Make predictions on the test set
predictions <- predict(model, newdata = testing_set)

# Evaluate the model
rmse <- sqrt(mean((predictions - testing_set[["vote_count"]])^2))
print(paste("Root Mean Squared Error:", rmse))

# Perform k-fold cross-validation
ctrl <- trainControl(method = "cv", number = 10)
cv_model <- train(vote_count ~ ., data = training_set, method = "lm", trControl = ctrl)

# Print cross-validation results
print(cv_model)

# Access the mean performance metrics across folds
summary(cv_model)

#Individual Scatter Plots Showing Relationship Between Vote Count and Revenue.
scatter_plot_matrix <- ggplot(testing_set, aes(x = revenue, y = vote_count)) +
  geom_point(shape = 2, color = "blue", size = 2) +
  labs(title = "Scatter Plot Matrix: Revenue/Vote Count",
       x = "Revenue",
       y = "Vote Count")
scatter_plot_matrix

#Individual Line Plots Showing Relationship Between Vote Count and Popularity.
ggplot(testing_set, aes(x = popularity, y = vote_count)) +
  geom_line()

#Perform ANOVA testing
#Create a new variable from dataset for testing
anovas <- dataset %>%
  select(vote_count, release_date)
summary(anovas)

#Split dataset into a training set and a test set.
set.seed(123)
index <- createDataPartition(anovas$release_date, p = 0.8, list = FALSE)
train_data <- anovas[index, ]
test_data <- anovas[-index, ]

#Create ANOVA model
anova_model <- aov(vote_count ~ release_date, data = train_data)
summary(anova_model)

#Conduct post-hoc tests 
TukeyHSD(anova_model)

#Lineplot for one-way ANOVA
ggplot(train_data, aes(x = release_date, y = vote_count)) +
  geom_line(color = "blue") +
  labs(title = "Vote Count Per Release Date",
       x = "Release Date",
       y = "Vote Count")
