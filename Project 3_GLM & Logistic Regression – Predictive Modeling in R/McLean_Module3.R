#Module 3 Assignment - GLM and Logistic Regression

install.packages("ISLR")
library(ISLR)
install.packages("pROC")
library(pROC)
install.packages("caret")
library(caret)
library(ggplot2)
library(gridExtra)
attach(College)    

#Question 1: Import the dataset and perform Exploratory Data Analysis by using descriptive statistics 
#and plots to describe the dataset.

summary(College)
View(College)
dim(College)
head(College)
tail(College)
str(College)
class(College)
range(College$Grad.Rate)

hist(College$Top10perc, main = "Top 10 Percentile Schools", col = "purple", xlab = "Percentile")

plot(College$Enroll, College$Top10perc, main = "Enrollment to Top 10 School Pct. Ratio", 
     col = c("yellow", "green"), pch = 19, xlab = "Enrollment Size", ylab = "Top 10 Percentage")
legend("topright", legend = c("Enroll", "Top 10 %"), col = c("yellow", "green"), lty = c(1, 2), lwd = 2, bty = "n", inset = c(0.02, 0.02))

qplot(x=Enroll, y=Grad.Rate, color=Private, shape=Private, geom = 'point') + scale_shape(solid = FALSE)

x <- qplot(x=Private, y=Top10perc, fill=Private, geom = "boxplot") + guides(fill = FALSE)
y <- qplot(x=Private, y=Enroll, fill=Private, geom = "boxplot") + guides(fill = FALSE)
z <- qplot(x=Private, y=Grad.Rate, fill=Private, geom = "boxplot") + guides(fill = FALSE)
grid.arrange(x,y,z, nrow = 1)

#Question 2: Split the data into a train and test set – refer to the Feature_Selection_R.pdf document for 
#information on how to split a dataset.

# load data
data("College")
head(College)

# Create Train and Test set - random sample (70/30 split)
trainIndex <- sort(sample(x = nrow(College), size = nrow(College) * 0.7))
sample_train <- College[trainIndex,]
sample_test <- College[-trainIndex,]

# Create Train and Test set - maintain % of event rate (70/30 split)
library(caret)
set.seed(123)
trainIndex <- createDataPartition(College$Private, p = 0.7, list = FALSE, times = 1)
caret_train <- College[ trainIndex,]
caret_test <- College[-trainIndex,]

head(caret_train, n = 100)
head(caret_test)

dim(caret_train)
dim(caret_test)

#Question 3: Use the glm() function in the ‘stats’ package to fit a logistic regression model to the 
#training set using at least two predictors. 

model1 <- glm(Private ~., data = caret_train, family = binomial(link = "logit"))
summary(model1)

model2 <- glm(Private ~ Enroll + Grad.Rate + Top10perc, data = caret_train, family = binomial(link = "logit"))
summary(model2)

#Display regression coefficients (log-odds)
coef(model2)

#Display rergression coefficents (odds)
exp(coef(model2))

#View min, mean and max values for pedigree
summary(College$Grad.Rate)

#Question 4: Create a confusion matrix and report the results of your model for the train set. Interpret 
#and discuss the confusion matrix. Which misclassifications are more damaging for the 
#analysis, False Positives or False Negatives?

#Make predictions on the test data using lambda.min
probabilities.train <- predict(model2, newdata = caret_train, type = 'response')
predicted.classes.min <- as.factor(ifelse(probabilities.train >= 0.5, "Yes", "No"))

#Model Accuracy
confusionMatrix(predicted.classes.min, caret_train$Private, positive = 'Yes')

#Question 5: Report and interpret metrics for Accuracy, Precision, Recall, and Specificity.

#Question 6: Create a confusion matrix and report the results of your model for the test set.

#Test set predictions
probabilities.test <- predict(model2, newdata = caret_test, type = 'response')
predicted.classes.min <- as.factor(ifelse(probabilities.test >= 0.5, "Yes", "No"))

#Model Accuracy
confusionMatrix(predicted.classes.min, caret_test$Private, positive = 'Yes')

#Question 7: Plot and interpret the ROC curve
ROC1 <- roc(caret_test$Private, probabilities.test)

plot(ROC1, col = "blue", ylab = "Sensitivity ~ TP Rate", xlab = "Specificity ~ FP Rate")

#Question 8: Calculate and interpret the AUC.

#Calculate the area under the ROC curve
auc <- auc(ROC1)
auc
