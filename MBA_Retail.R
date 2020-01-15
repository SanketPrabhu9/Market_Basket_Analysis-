#Setting working directory
setwd("E:/Pristine/Courses/BA/New/Final/Day 11 - Market Basket Analysis/Retail")

#Reading the data
txn_data<-read.csv("Retail_Data.csv")

#Verifying data/ summarizing data
head(txn_data)
tail(txn_data)
summary(txn_data)

#Installing and loading the required package
install.packages("arules")
library(arules)

#Glimpse of the data
#Installing required package
install.packages("dplyr")
library(dplyr)
glimpse(txn_data)
str(txn_data)

#Factorization of variables
for ( i in 1:ncol(txn_data))
{
  txn_data[,i]=as.factor(txn_data[,i])
}

#Looking at the data again
glimpse(txn_data)
#All are factors now

#Plot of relative frequency
txn_data<-as(txn_data,"transactions")
itemFrequencyPlot(txn_data, topN = 9)

#Running aproiori command
basket_rules <- apriori(txn_data, parameter = list(sup = 0.005, conf = 0.01, target="rules", minlen=2,maxlen=3))


#Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(basket_rules[1:5])

#Sorting by confidence
basket_rules<-sort(basket_rules, by="confidence", decreasing=TRUE)
inspect(basket_rules[1:5])

#Visualizing the final rules
#Installing and loading required pacakge
install.packages("arulesViz")
library(arulesViz)
plot(basket_rules[1:50],method="graph", interactive = TRUE)