#ALY 6015 Assignment 5: Nonparametric Statistical Methods / Sampling and Simulation

#Section 13-2
#Question 6: Game attendance

#State hypotheses and claim
# H0: median = 3000 (claim)
# H1: median !=3000

#Set significance level
alpha <- 0.05

#Claim is the median number for the paid attendance at 20 local football games is 3000.
median <- 3000

#A sample of 20 local football games is taken showing the game attendances
games <- c(6210, 3150, 2700, 3012, 4875, 3540, 6127, 2581, 2642, 2573, 2792, 
           2800, 2500, 3700, 6030, 5437, 2758, 3490, 2851, 2720)

#Find the differences  
difference <- games - median
difference

#Find the critical value
#a=0.05, n=20, two-tailed test, cv=5

#Determine the number of games where the attendance was above 3000
#exclude 0 values; + sign if value is greater than median, - sign is less
pos <- length(difference[difference > 0])

#Determine the number of games where the attendance was below 3000
neg <- length(difference[difference < 0])

#Run the test and save the results to the result variable
result <- binom.test(x = c(pos, neg), alternative = "two.sided")
result

#View the p-value
result$p.value

#Determine if we should reject the null hypothesis
ifelse(result$p.value > alpha, "fail to reject the null", "reject the null")

#State our conclusion
#There is not enough evidence to reject the claim that the paid attendance at 20 
#local football games is 3000.

#Question 10: Lottery Ticket Sales

#State hypotheses and claim
# H0: median = 200 
# H1: median < 200 (claim)

#Set significance level
alpha <- 0.05

#Claim is the lottery outlet owner hypothesized that she sells 200 lottery tickets a day.
median <- 200

#Critical value
#n = 200 and alpha = 0.05, cv = 88
critical_value_lower <- qbinom(0.05, size = 200, prob = 0.5, lower.tail = TRUE)
critical_value_lower

#Find the test value
# Number of days
total_days <- 40

# Number of days with fewer than 200 tickets sold
days_fewer_than_200 <- 15

# Hypothesized probability (under the null hypothesis)
p_null <- 0.5 

# Perform a one-sided binomial test
binom_test_result <- binom.test(x = days_fewer_than_200, n = total_days, p = p_null, alternative = "less")

# Display the test result
binom_test_result

#View the p-value
binom_test_result$p.value

#Determine if we should reject the null hypothesis
ifelse(binom_test_result$p.value > alpha, "fail to reject the null", "reject the null")

#State our conclusion
#There is not sufficient evidence to conclude that the median is below 200 tickets.

#Section 13-3
#Question 4: Lengths of Prison Sentences
#State hypotheses and claim
# H0: There is no difference in the sentence received by each gender.(claim)
# H1: There is a difference in the sentence received by each gender.

#Set significance level
alpha <- 0.05

#Find the critical value
# Degrees of freedom
df <- 12 + 14 - 2

# Critical t-values for a two-tailed test with alpha = 0.05
critical_t_values <- qt(c(0.025, 0.975), df)

# Display the critical t-values
critical_t_values

#Create vectors for the values per gender
males <- c(8, 12, 6, 14, 22, 27, 32, 24, 26, 19, 15, 13)
females <- c(7, 5, 2, 3, 21, 26, 30, 9, 4, 17, 23, 12, 11, 16)

#Run the test and save the results to the result variable
result <- wilcox.test(x = males, y = females, alternative = "two.sided", correct = FALSE)
result

#View the p-value
result$p.value

#Compare the p-value to alpha and make the decision
ifelse(result$p.value > alpha, "fail to reject the null", "reject the null")

#State our conclusion
#There is not enough evidence to support the claim that there is 
#no difference in the sentence received by each gender.

#Question 8: Winning Baseball Games

#State hypotheses and claim
# H0: There is no difference in the number of wins between the leagues.
# H1: There is a difference in the number of wins between the leagues.(claim)

#Set significance level
alpha <- 0.05

#Find the critical value
# Degrees of freedom
df <- 12 + 11 - 2

# Critical t-values for a two-tailed test with alpha = 0.05
critical_t_values <- qt(c(0.025, 0.975), df)

# Display the critical t-values
critical_t_values

#Create vectors for the values per gender
al <- c(108, 86, 91, 97, 100, 102, 95, 104, 95, 89, 88, 101)
nl <- c(89, 96, 88, 101, 90, 91, 92, 96, 108, 100, 95)

#Run the test and save the results to the result variable
result <- wilcox.test(x = al, y = nl, alternative = "two.sided", correct = FALSE)
result

#View the p-value
result$p.value

#Compare the p-value to alpha and make the decision
ifelse(result$p.value > alpha, "fail to reject the null", "reject the null")

#State our conclusion
#There is not enough evidence to support the claim that there is 
#a difference in the amount of wins between the leagues.

#Section 13-4
#Use Table K to determine whether the null hypothesis should be rejected.

#Question 5: ws = 13, n = 15, α = 0.01, two-tailed
#Critical value: 16
#Reject the null hypothesis because the test value is less than or equal to the critical value.

#Question 6:  ws = 32, n = 28, α = 0.025, one-tailed
#Critical value: 117
#Reject the null hypothesis because the test value is less than or equal to the critical value.

#Question 7:  ws = 65, n = 20, α = 0.05, one-tailed
#Critical value: 60
#Fail to reject the null hypothesis because the test value is larger than or equal to the critical value.

#Question 8:  ws = 22, n = 14, α = 0.10, two-tailed
#Critical value: 26
#Reject the null hypothesis because the test value is less than or equal to the critical value.

#Section 13-5
#Question 2:  Mathematics Literacy Scores
#State hypotheses and claim
# H0: There is no difference in means of literacy scores between the three regions. 
# H1: There is a difference in means of literacy scores between the three regions. (claim)

#Set significance level
alpha <- 0.05

#Critical Value (df: 3-1=2, a = 0.05, cv=5.991)

#Create a dataframe for the three regions
westernhem <- data.frame(literacy = c(527, 406, 474, 381, 411), group = rep("westernhem", 5))
europe <- data.frame(literacy = c(520, 510, 513, 548, 496), group = rep("europe", 5))
easternasia <- data.frame(literacy = c(523, 547, 547, 391, 549), group = rep("easternasia", 5))

#Combine the dataframes into one
data <- rbind(westernhem, europe, easternasia)

#Run the test and save the results to the result variable
result <- kruskal.test(literacy ~ group, data = data)
result

#View the p-value
result$p.value

#Compare the p-value to alpha and make the decision
ifelse(result$p.value > alpha, "fail to reject the null", "reject the null")

#State our conclusion
#There is not enough evidence to support the claim that there is a difference 
#in means of literacy scores between the three regions.

#Section 13-6
#Question 6: Subway and Commuter Rail Passengers
#State hypotheses and claim
# H0: There is no correlation between the number of daily passenger trips for subways and commuter rail service in the six cities.
# H1: There is a significant correlation between the number of daily passenger trips for subways and commuter rail service in the six cities.

#Set significance level
alpha <- 0.05

#Critical Value (n=6, a = 0.05, cv=0.886)

#Create vectors for cities, subways and rails
cities <- c(1, 2, 3, 4, 5, 6)
subways <- c(845, 494, 425, 313, 108, 41)
rail <- c(39, 291, 142, 103, 33, 38)

#Combine the dataframes into one
data <- data.frame(cities = cities, subways = subways, rail = rail)

result <- cor.test(x = data$subways,y = data$rail, method = "spearman")
result

#View the p-value
result$p.value
result$estimate

#Compare the p-value to alpha and make the decision
ifelse(result$p.value > alpha, "fail to reject the null", "reject the null")

#State our conclusion
#There is not enough evidence to support the claim that there is a significant 
#correlation between the number of daily passenger trips for subways and 
#commuter rail service in the six cities.

#Section 14-3
#Question 16: Prizes in Caramel Corn Boxes

set.seed(123)

# Number of simulations
num_simulations <- 40

# Function to simulate the experiment and return the number of boxes needed
simulate_experiment <- function() {
  prizes <- c("Prize1", "Prize2", "Prize3", "Prize4")
  boxes <- character(0)
  attempts <- 0
  
  while (length(unique(boxes)) < length(prizes)) {
    prize <- sample(prizes, 1)
    boxes <- c(boxes, prize)
    attempts <- attempts + 1
  }
  
  return(attempts)
}

# Simulate the experiment 40 times and store the results
simulations <- replicate(num_simulations, simulate_experiment())

# Calculate the average number of boxes needed
average_boxes <- mean(simulations)

# Display the results
cat("Simulations:", simulations, "\n")
cat("Average number of boxes needed:", average_boxes, "\n")

#Question 18: Lottery Winner
set.seed(123)

# Number of simulations
num_simulations <- 30

# Function to simulate the experiment and return the number of tickets needed to win
simulate_lottery <- function() {
  letters <- c("b", "i", "g")
  target_word <- c("b", "i", "g")
  tickets <- character(0)
  attempts <- 0
  
  while (!identical(tail(tickets, length(target_word)), target_word)) {
    letter <- sample(letters, 1, prob = c(0.6, 0.3, 0.1))
    tickets <- c(tickets, letter)
    attempts <- attempts + 1
  }
  
  return(attempts)
}

# Simulate the experiment 30 times and store the results
simulations <- replicate(num_simulations, simulate_lottery())

# Calculate the average number of tickets needed
average_tickets <- mean(simulations)

# Display the results
cat("Simulations:", simulations, "\n")
cat("Average number of tickets needed:", average_tickets, "\n")
