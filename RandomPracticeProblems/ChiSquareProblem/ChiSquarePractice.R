library(tidyverse)

setwd('/Users/justinhayes/Desktop/R For Data Science/RandomPracticeProblems/ChiSquareProblem')
exp <- read.csv('chi1.csv')
attach(exp)
head(exp)
dim(exp)

# Visualize count within each age bin and filled with experience variable
ggplot(exp, aes(x = age.intervals, fill = Experience.intervals)) +
  geom_histogram(stat = "count")

# Step 3 - Calculate the proportion of experience of employees

# Proportion table for observed frequencies, percentages
prop.table(table(Experience.intervals))

# Calculate the Chi-Square Value
chisq.test(x = table(Experience.intervals), 
           p = c(0.2, 0.17, 0.41, 0.22)) # p = percentages reported by company

# Results:
# Chi-squared test for given probabilities
# data:  table(Experience.intervals)
# X-squared = 14.762, df = 3, p-value = 0.002032 *SIGNIFICANT - Actual percentages
# differ from those reported*

