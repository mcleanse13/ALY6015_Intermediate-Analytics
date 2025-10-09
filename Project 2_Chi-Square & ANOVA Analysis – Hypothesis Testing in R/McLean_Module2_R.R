library(dplyr)
library(ggplot2)
library(corrplot)
library(RColorBrewer)
library(car)
library(MASS)

#Section 11-1
#Question 6: Blood Types
#State the hypothesis
#H0: Type A = 0.20, Type B = 0.28, Type O = 0.36, Type AB = 0.16
#H1: At least one of the blood types is not the same as 
#its value stated in the null hypothesis.

#Find the Critical Value
#df = 3, a = 0.10, Critical Value = 6.251

#Compute the Test Value
#Set significance value
alpha <- 0.10

#Create a vector of the values
observed <- c(12, 8, 24, 6)

#Create a vector for the probabilities
p <- c(0.20, 0.28, 0.36, 0.16)

#Run the test and save the results to the result variable
result <- chisq.test(x = observed, p = p)

#View the test statistic and p-value
result$statistic  #Chi-square test value
result$p.value    #Chi-square p-value
result$parameter  #Degrees of freedom (# of categories - 1)

result

#Make the decision
#Since our chi-square value is less than the critical value we should fail to 
#reject the null hypothesis.

#Summarize the results
#There is not enough evidence to reject the claim that the blood type 
#distribution at the hospital is the same as that of the general population.

#Question 8: On-Time Performance by Airlines
#State the hypothesis
#H0: On time = 70.8, NAS Delay = 8.2, Late = 9.0, Other = 12.0
#H1: The on-time performance of the airline company is different from 
#the government's statistics.

#Find the Critical Value
#df = 3, a = 0.05, Critical Value = 7.815

#Compute the Test Value
#Set significance value
alpha <- 0.05

#Create a vector of the values
observed1 <- c(125, 10, 25, 40)

#Create a vector for the probabilities
p1 <- c(0.708, 0.082, 0.09, 0.12)

#Run the test and save the results to the result variable
result1 <- chisq.test(x = observed1, p = p1)

#View the test statistic and p-value
result1$statistic  #Chi-square test value
result1$p.value    #Chi-square p-value
result1$parameter  #Degrees of freedom (# of categories - 1)

result1

#Make the decision
#Since our chi-square value is more than the critical value we should 
#reject the null hypothesis.

#Summarize the results
#There is enough evidence to reject the claim that the on-time performance 
#by airlines is 70.8% on time, 8.2% NAS delays, 9% arriving late, and 12% other.

#Section 11-2
#Question 8: Ethnicity and Movie Admissions
#State the hypothesis
#H0: There is no relationship between ethnicity and movie attendance.
#H1: There is a significant relationship between ethnicity and movie attendance.

#Find the Critical Value
#df = 3, a = 0.05, Critical Value = 7.815

#Compute the Test Value
alpha <- 0.05

#Create one vector for each row
r1 <- c(724, 335, 174, 107)
r2 <- c(370, 292, 152, 140)

#State the number of rows for the matrix
rows = 2

#Create a matrix from the rows
mtrx = matrix(c(r1, r2), nrow = rows, byrow = TRUE)

#Name the rows and columns (columns optional)
rownames(mtrx) = c("2013", "2014")
colnames(mtrx) = c("Caucasian", "Hispanic", "African American", "Other")

#View the matrix to ensure it matches your table
mtrx

#Run the test and save the results to the result variable
result2 <- chisq.test(mtrx)
result2

#View the test statistic and p-value
result2$statistic  #Chi-square test value
result2$p.value    #Chi-square p-value
result2$parameter  #degrees of freedom (# of columns - 1* # rows - 1)

#Make the decision
#Since our chi-square test value of 60.144 is greater than the critical value of 
#7.815 we should reject the null hypothesis.

#Summarize the results
#We will conclude that there is evidence that movie attendance by year is 
#dependent on ethnicity.

#Question 10: Women in the Military
#State the hypothesis
#H0: The distribution of women across different ranks is independent of the
#branch of the Armed Forces.
#H1: The distribution of women across different ranks is dependent on the branch 
#of the Armed Forces.

#Compute the Test Value
alpha <- 0.05

#Find the Critical Value
#df = 3, a = 0.05, Critical Value = 7.815

#Create one vector for each row
r1 <- c(10791, 62491)
r2 <- c(7816, 42750)
r3 <- c(932, 9525)
r4 <- c(11819, 54344)

#State the number of rows for the matrix
rows = 4

#Create a matrix from the rows
mtrx1 = matrix(c(r1, r2, r3, r4), nrow = rows, byrow = TRUE)

#Name the rows and columns (columns optional)
rownames(mtrx1) = c("Army", "Navy", "Marine Corps", "Air Force")
colnames(mtrx1) = c("Officers", "Enlisted")

#View the matrix to ensure it matches your table
mtrx1

#Run the test and save the results to the result variable
result3 <- chisq.test(mtrx1)
result3

#View the test statistic and p-value
result3$statistic  #Chi-square test value
result3$p.value    #Chi-square p-value
result3$parameter  #degrees of freedom (# of columns - 1* # rows - 1)

#Make the decision
#Since our chi-square test value of 654.27 is greater than the critical value of 
#7.815 we should reject the null hypothesis.

#Summarize the results
#There is significant evidence to reject the claim that the distribution of 
#women across different ranks is independent of the branch of the Armed Forces.

#Section 12-1
#Question 8: Sodium Contents of Foods
#State the hypotheses
#H0:There is no difference in mean sodium amounts between condiments, cereals, 
#and desserts.
#H1: There is at least one mean that is different from the others in the three 
#three different food groups.

#Find the Critical Value
#df = 2, 19, a = 0.05, Critical Value = 3.52

#Set the significant level
alpha <- 0.05

#Create a data frame for condiments
condiments <- data.frame('sodium' = c(270, 130, 230, 180, 80, 70, 200), 'food' = rep('condiments', 7), stringsAsFactors = FALSE)

#Create a data frame for cereals
cereals <- data.frame('sodium' = c(260, 220, 290, 290, 200, 320, 140), 'food' = rep('cereals', 7), stringsAsFactors = FALSE)

#Create a data frame for desserts
desserts <- data.frame('sodium' = c(100, 180, 250, 250, 300, 360, 300, 160), 'food' = rep('desserts', 8), stringsAsFactors = FALSE)

#Combine the data frames into one
sodium <- rbind(condiments, cereals, desserts)
sodium$food <- as.factor(sodium$food)

View(sodium)

#Run the ANOVA test
anova <- aov(sodium ~ food, data = sodium)

#View the model summary
summary(anova)

#Save summary to an object
a.summary <- summary(anova)

#Degrees of freedom
# k-1: between group variance ~ numerator
df.numerator <- a.summary[[1]][1, "Df"]
df.numerator

#N ~ k: within group variance ~ denominator
df.denominator <- a.summary[[1]][2, "Df"]
df.denominator

#Extract the F test value from the summary
F.value <- a.summary[[1]][[1, "F value"]]
F.value

#Extract the p-value from the summary
p.value <- a.summary[[1]][[1, "Pr(>F)"]]
p.value

#See differences
TukeyHSD(anova)

#Make the decision
#Because the test value of 2.399 is less than the critical value of 3.52 we 
#should not reject the null hypothesis.

#Summarize the results, and explain where the differences in the means are.
#There is not enough evidence to conclude that a difference in mean sodium 
#amounts exists in the food groups, with the largest mean differences coming 
#from the condiments being paired with the other food groups.

#Section 12-2
#Question 10: Sales for Leading Companies
#State the hypotheses
#H0:There is no significant difference in the means of sales between the 
#the three companies.
#H01:There is a significant difference in the means of sales between the 
#the three companies.

#Find the Critical Value
#df = 2, 11, a = 0.01, Critical Value = 7.206

#Set the significant level
alpha <- 0.01

#Create a data frame for cereal
cereal <- data.frame('sales' = c(578, 320, 264, 249, 237), 'companies' = rep('cereal', 5), stringsAsFactors = FALSE)

#Create a data frame for chocolate candy
choc <- data.frame('sales' = c(311, 106, 109, 125, 173), 'companies' = rep('choc', 5), stringsAsFactors = FALSE)

#Create a data frame for coffee
coffee <- data.frame('sales' = c(261, 185, 302, 689), 'companies' = rep('coffee', 4), stringsAsFactors = FALSE)

#Combine the data frames into one
sales <- rbind(cereal, choc, coffee)
sales$companies <- as.factor(sales$companies)

View(sales)

#Run the ANOVA test
anova1 <- aov(sales ~ companies, data = sales)

#View the model summary
summary(anova1)

#Save summary to an object
a.summary1 <- summary(anova1)

#Degrees of freedom
# k-1: between group variance ~ numerator
df.numerator <- a.summary1[[1]][1, "Df"]
df.numerator

#N ~ k: within group variance ~ denominator
df.denominator <- a.summary1[[1]][2, "Df"]
df.denominator

#Extract the F test value from the summary
F.value1 <- a.summary1[[1]][[1, "F value"]]
F.value1

#Extract the p-value from the summary
p.value1 <- a.summary1[[1]][[1, "Pr(>F)"]]
p.value1

#See differences
TukeyHSD(anova1)

#Make the decision
#Because the test value of 2.172 is less than the critical value of 7.206 we 
#should not reject the null hypothesis.

#Summarize the results, and explain where the differences in the means are.
#There is not enough evidence to conclude that there is a difference in mean 
#sales between the three companies.

#Question 12: Per-Pupil Expenditures
#State the hypotheses
#H0:There is no difference in the means of expenditures between the 
#the three sections of the country.
#H01:There is a difference in at least one of the expenditures between the 
#the three sections of the country.

#Find the Critical Value
#df = 2, 9, a = 0.05, Critical Value = 4.256

#Set the significant level
alpha <- 0.05

#Create a data frame for Eastern third
eastern <- data.frame('expenditures' = c(4946, 5953, 6202, 7243), 'country' = rep('eastern', 4), stringsAsFactors = FALSE)

#Create a data frame for Middle third
middle <- data.frame('expenditures' = c(6149, 7451, 6000, 6479), 'country' = rep('middle', 4), stringsAsFactors = FALSE)

#Create a data frame for Western third
western <- data.frame('expenditures' = c(5282, 8605, 6528, 6911), 'country' = rep('western', 4), stringsAsFactors = FALSE)

#Combine the data frames into one
expenditures <- rbind(eastern, middle, western)
expenditures$country <- as.factor(expenditures$country)

View(expenditures)

#Run the ANOVA test
anova2 <- aov(expenditures ~ country, data = expenditures)

#View the model summary
summary(anova2)

#Save summary to an object
a.summary2 <- summary(anova2)

#Degrees of freedom
# k-1: between group variance ~ numerator
df.numerator <- a.summary2[[1]][1, "Df"]
df.numerator

#N ~ k: within group variance ~ denominator
df.denominator <- a.summary2[[1]][2, "Df"]
df.denominator

#Extract the F test value from the summary
F.value2 <- a.summary2[[1]][[1, "F value"]]
F.value2

#Extract the p-value from the summary
p.value2 <- a.summary2[[1]][[1, "Pr(>F)"]]
p.value2

#See differences
TukeyHSD(anova2)

#Make the decision
#Because the test value of 0.526 is less than the critical value of 4.256 we 
#should not reject the null hypothesis.

#Summarize the results, and explain where the differences in the means are.
#We did not reject the null hypothesis because there is not enough evidence to 
#conclude that a difference in means is evident among the three sections of the
#country.

#Section 12-3
#Question 10: Increasing Plant Growth
#State the hypotheses
#H0: The means of the grow light groups are equal.
#H1: The means of the grow light groups are different

#H0: The means of the plant food supplement groups are equal.
#H1: The means of the plant food supplement groups are different

#H0: There is no interaction between the grow light and plant food supplement.
#H1: There is an interaction between the grow light and plant food supplement.

#Set the significant level
alpha <- 0.05

#Find the Critical Value
critical_value <- qf(1 - alpha, df1 = 1, df2 = 8)
print(critical_value)
#df = 1, 8, a = 0.05, Critical Value = 5.317655

#Create a data frame for both factors
growth <- data.frame(
  Grow_light = rep(c("Light 1", "Light 2"), each = 6),
  Plant_Food_Supplement = rep(c("Supplement 1", "Supplement 2"), times = 6),
  Growth = c(9.2, 8.5, 9.4, 9.2, 8.9, 8.9, 7.1, 5.5, 7.2, 5.8, 8.5, 7.6)
)

View(growth)

#Perform two-way ANOVA
anova3 <- aov(Growth ~ Grow_light * Plant_Food_Supplement, data = growth)

#View the model summary
summary(anova3)

#Save summary to an object
a.summary3 <- summary(anova3)

#Degrees of freedom
# k-1: between group variance ~ numerator
df.numerator <- a.summary3[[1]][1, "Df"]
df.numerator

#N ~ k: within group variance ~ denominator
df.denominator <- a.summary3[[1]][2, "Df"]
df.denominator

#Extract the F test value from the summary
F.value3 <- a.summary3[[1]][[1, "F value"]]
F.value3

#Extract the p-value from the summary
p.value3 <- a.summary3[[1]][[1, "Pr(>F)"]]
p.value3

#See differences
TukeyHSD(anova3)

# Factorial plot
ggplot(growth, aes(x = Grow_light, y = Growth, fill = Plant_Food_Supplement)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Factorial Plot For Plant Growth", x = "Grow_light", y = "Growth", fill = "Plant_Food_Supplement")

#Make the decision
#Because the f-test value of the factor interactions of 1.438 is less than the 
#critical value of 5.318 we should fail to reject the null hypothesis.

#Summarize the results, and explain where the differences in the means are.
#We failed to reject the null hypothesis because there is not enough evidence to 
#conclude that there is a difference in mean growth with light, mean growth 
#with plant food, and an interaction between the two factors on growth.

#Baseball Question
#Importing the dataset
baseball <- read.csv("baseball.csv", header=TRUE)
baseball

#Summary statistics of the data set
summary(baseball)
View(baseball)
dim(baseball)
head(baseball)
tail(baseball)
str(baseball)
class(baseball)
range(baseball$SLG)

# Line plot for batting average over different seasons
ggplot(baseball, aes(x = Year, y = BA)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "blue", size = 1.5) +
  labs(title = "MLB Team Batting Averages Over Time",
       x = "Seasons",
       y = "Batting Average") +
  theme_minimal()

# Line plot for Slugging Percentage over different decades
ggplot(baseball, aes(x = Decade, y = SLG)) +
  geom_line(color = "red", size = 0.5) +
  geom_point(color = "red", size = 1) +
  labs(title = "MLB Team Batting Averages Over Time",
       x = "Decades",
       y = "Slugging Percentage") +
  theme_minimal()

# Bar plot for playoff appearances per team
ggplot(baseball, aes(x = Team, y = Playoffs)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Playoff Appearances Per Team",
       x = "Team",
       y = "Number of Playoff Appearances") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

# Extract decade from year
baseball$Decade <- baseball$Year - (baseball$Year %% 10)
# Create a wins table by summing the wins by decade
wins <- baseball %>%
  group_by(Decade) %>% summarize(wins = sum(W)) %>% 
    as.tibble()
wins

#State the hypothesis
#H0: There is no difference in the number of wins by decade for all teams.
#H1: There is at least one difference in the number of wins by decade for 
#all teams.

#Find the Critical Value
#df = 5, a = 0.05, Critical Value = 2.015

#Compute the Test Value
#Set significance value
alpha <- 0.05

#Create a vector for the wins
wins <- c(13267, 17934, 18926, 17972, 24286, 7289)

# Calculate probabilities per value in the vector
probabilities <- prop.table(wins)

# Display the values, their probabilities, and the total probability
for (i in seq_along(wins)) {
  print(paste("Decade:", i, "Wins:", wins[i], "Probability:", probabilities[i]))
}

print(paste("Total Probability:", sum(probabilities)))

#Create a vector for the probabilities
decades <- c(0.133, 0.180, 0.190, 0.180, 0.244, 0.073)

#Run the test and save the results to the result variable
results <- chisq.test(x = wins, p = decades)

#View the test statistic and p-value
results$statistic  #Chi-square test value
results$p.value    #Chi-square p-value
results$parameter  #Degrees of freedom (# of categories - 1)

results

#Make the decision
#Since our chi-square value is less than the critical value we should fail to 
#reject the null hypothesis.

#Summarize the results
#Our conclusion would be that the wins proportions by decade when comparing 
#test and critical values and p-values and significant levels provides the same 
#results in that it doesn't provide enough evidence that there is a difference 
#in the number of wins per decade for the teams.


#Crop Question
#Importing the dataset
crop <- read.csv("crop_data.csv", header=TRUE)
crop

View(crop)

#Section 12-3
#Question 10: Increasing Plant Growth
#State the hypotheses
#H0: The fertilizer will not have an impact on the yield.
#H1: The fertilizer will have an impact on the yield.

#H0: The density will not have an impact on the yield.
#H1: The density will have an impact on the yield.

#H0: There will be no interaction between the fertilizer and density.
#H1: There will be an interaction between the fertilizer and density.

#Set the significant level
alpha <- 0.05

#Finding the degrees of freedom
# Number of levels in each factor
a_factor1 <- 2
a_factor2 <- 3

# Total number of observations
N <- 96

# Degrees of freedom calculations
df_factor1 <- a_factor1 - 1
df_factor1
df_factor2 <- a_factor2 - 1
df_factor2
df_interaction <- df_factor1 * df_factor2
df_interaction
df_error <- N - a_factor1 * a_factor2
df_error
df_total <- N - 1
df_total

# Critical values for factors and interaction
critical_factor1 <- qf(1 - alpha/2, df_factor1, df_error)
critical_factor1
critical_factor2 <- qf(1 - alpha/2, df_factor2, df_error)
critical_factor2
critical_interaction <- qf(1 - alpha/2, df_interaction, df_error)
critical_interaction
#df = 95, a = 0.05, Critical Value = 3.844295

# Convert to factors
crop$density <- factor(crop$density)
crop$fertilizer <- factor(crop$fertilizer)
crop$block <- factor(crop$block)

#Perform two-way ANOVA
anova4 <- aov(yield ~ fertilizer * density, data = crop)

#View the model summary
summary(anova4)

#Save summary to an object
a.summary4 <- summary(anova4)

#Degrees of freedom
# k-1: between group variance ~ numerator
df.numerator <- a.summary4[[1]][1, "Df"]
df.numerator

#N ~ k: within group variance ~ denominator
df.denominator <- a.summary4[[1]][2, "Df"]
df.denominator

#Extract the F test value from the summary
F.value4 <- a.summary4[[1]][[1, "F value"]]
F.value4

#Extract the p-value from the summary
p.value4 <- a.summary4[[1]][[1, "Pr(>F)"]]
p.value4

#See differences
TukeyHSD(anova4)

#Make the decision
#Because the f-test value of the factors interaction of 0.635 is less than the 
#critical value of 3.844 we should fail to reject the null hypothesis.

#Summarize the results, and explain where the differences in the means are.
#We failed to reject the null hypothesis because there is not enough evidence 
#from the f-test and Tukey tests to conclude that density and fertilizer have 
#a significant impact on the yield.
