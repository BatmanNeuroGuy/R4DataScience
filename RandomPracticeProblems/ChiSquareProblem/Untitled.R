library(tidyverse)

setwd('/Users/justinhayes/Desktop/R For Data Science/RandomPracticeProblems')
exp <- read.csv('chi1.csv')
attach(exp)
head(exp)
dim(exp)

# Visualize count within each age bin and filled with experience variable
ggplot(exp, aes(x = age.intervals, fill = Experience.intervals)) +
  geom_histogram(stat = "count")

