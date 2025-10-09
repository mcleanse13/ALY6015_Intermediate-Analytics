#Module 4 Assignment - Regularization

install.packages("ISLR")
library(ISLR)
install.packages("pROC")
library(pROC)
install.packages("caret")
library(caret)
library(ggplot2)
library(gridExtra)
install.packages("glmnet")
library(glmnet)
install.packages("Metrics")
library(Metrics)
attach(College) 

#Question 1: Split the data into a train and test set – refer to the Feature_Selection_R.pdf 
#document for information on how to split a data set.

#Load data
data(College)
dataset <- College

#Split data into train and test sets
set.seed(123)
trainIndex <- sort(sample(x = nrow(dataset), size = nrow(dataset) * 0.7))
train <- dataset[trainIndex,]
test <- dataset[-trainIndex,]

train_x <- model.matrix(Grad.Rate ~., train)[,-1]
test_x <- model.matrix(Grad.Rate ~., test)[,-1]

train_y <- train$Grad.Rate
test_y <- test$Grad.Rate

head(train_x, n = 10)
head(test_x)
head(train_y, n = 10)
head(test_y)

#Question 2:  Use the cv.glmnet function to estimate the lambda.min and lambda.1se values. Compare and 
#discuss the values.
set.seed(123)
cv.ridge <- cv.glmnet(train_x, train_y, alpha = 0, nfolds = 10)

log(cv.ridge$lambda.min)
log(cv.ridge$lambda.1se)

#Question 3: Plot the results from the cv.glmnet function provide an interpretation. What does this plot 
#tell us?
plot(cv.ridge)

#Question 4: Fit a Ridge regression model against the training set and report on the coefficients. Is there 
#anything interesting?
model.ridge <- glmnet(train_x, train_y, alpha = 0, lambda = cv.ridge$lambda.min)
model.ridge

#Display regression coefficients
coef(model.ridge)

#Fit the final model on the training data using lambda.lse
model_lse_ridge <- glmnet(train_x, train_y, alpha = 0, lambda = cv.ridge$lambda.1se)

#Display regression coefficients
coef(model_lse_ridge)

#Display coefficients of ols model with no regularization
ols_ridge <- lm(Grad.Rate ~ ., data = train)
coef(ols_ridge)

#Question 5: Determine the performance of the fit model against the training set by calculating the root 
#mean square error (RMSE). sqrt(mean((actual - predicted)^2))

#View RMSE of full model
preds_ols_ridge <- predict(ols_ridge, new = test)
rmse(test$Grad.Rate, preds_ols_ridge)

#Make predictions on the train data using lambda.min
preds_train_ridge <- predict(model_lse_ridge, newx = train_x)
train_rmse_ridge <- rmse(train_y, preds_train_ridge)

#Compute the RMSE
ridge_rmse_train <- sqrt(mean((train_y - preds_train_ridge)^2))
ridge_rmse_train

#Question 6: Determine the performance of the fit model against the test set by calculating the root mean 
#square error (RMSE). Is your model overfit?

preds_test_ridge <- predict(model_lse_ridge, newx = test_x)
test_rmse_ridge <- rmse(test_y, preds_test_ridge)

#Compute the RMSE
ridge_rmse_test <- sqrt(mean((test_y - preds_test_ridge)^2))
ridge_rmse_test

#Compare rmse values
ridge_rmse_train
ridge_rmse_test
rmse(test$Grad.Rate, preds_ols_ridge)

#Question 7: Use the cv.glmnet function to estimate the lambda.min and lambda.1se values. Compare and 
#discuss the values.
set.seed(123)
cv.lasso <- cv.glmnet(train_x, train_y, alpha = 1, nfolds = 10)

log(cv.lasso$lambda.min)
log(cv.lasso$lambda.1se)

#Question 8:  Plot the results from the cv.glmnet function provide an interpretation. What does this plot 
#tell us?
plot(cv.lasso)

#Question 9:  Fit a LASSO regression model against the training set and report on the coefficients. Do any 
#coefficients reduce to zero? If so, which ones?
model_lasso <- glmnet(train_x, train_y, alpha = 1, lambda = cv.lasso$lambda.min)
model_lasso

#Display regression coefficients
coef(model_lasso)

#Fit the final model on the training data using lambda.lse
model_lse_lasso <- glmnet(train_x, train_y, alpha = 1, lambda = cv.lasso$lambda.1se)

#Display regression coefficients
coef(model_lse_lasso)

#Display coefficients of ols model with no regularization
ols_lasso <- lm(Grad.Rate ~ ., data = train)
coef(ols_lasso)

#Question 10: Determine the performance of the fit model against the training set by calculating the root 
#mean square error (RMSE). sqrt(mean((actual - predicted)^2))

#View RMSE of full model
preds_ols_lasso <- predict(ols_lasso, new = test)
rmse(test$Grad.Rate, preds_ols_lasso)

#Make predictions on the train data using lambda.min
preds_train_lasso <- predict(model_lse_lasso, newx = train_x)
train_rmse_lasso <- rmse(train_y, preds_train_lasso)

#Compute the RMSE
lasso_rmse <- sqrt(mean((train_y - preds_train_lasso)^2))
lasso_rmse

#Question 11: Determine the performance of the fit model against the test set by calculating the root mean 
#square error (RMSE). Is your model overfit?

preds_test_lasso <- predict(model_lse_lasso, newx = test_x)
test_rmse_lasso <- rmse(test_y, preds_test_lasso)

#Compare rmse values
train_rmse_lasso
test_rmse_lasso
rmse(test$Grad.Rate, preds_ols_lasso)

#Comparison
#Question 12: Which model performed better and why? Is that what you expected?

#Question 13: Refer to the Intermediate_Analytics_Feature_Selection_R.pdf document for how to perform stepwise 
#selection and then fit a model. Did this model perform better or as well as Ridge regression 
#or LASSO? Which method do you prefer and why?

#Stepwise selection method and fit the model
step(lm(Grad.Rate ~ ., data = College), direction = 'both')
model_step <- step(lm(Grad.Rate ~ ., data = College), direction = 'both')
summary(model_step)
coef(model_step) 

#Make predictions on Grad Rate
stepwise <- predict(model_step, newdata = test)
stepwise

#Compute the RMSE
stepwise_rmse <- sqrt(mean((test$Grad.Rate - stepwise)^2))
stepwise_rmse
