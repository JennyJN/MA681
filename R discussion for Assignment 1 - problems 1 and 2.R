# R you need for assignment 1, problems 1 and 2

# make your answer reproducible
seed=252015
set.seed(seed)

# set the number of replicates 
n<-30

# set a probability mass function for an discrete random variable and calculate its CDF
suz.pmf<-c(0.1677, 0.3354, 0.2857, 0.1491, 0.0373, 0.0248)
suz.cdf<-c(0,cumsum(suz.pmf))

# generate a series of random probabilities
p<-runif(n)

# bin the random series of probabilities, using the CDF
h<-cut(p,suz.cdf,labels=0:5,include.lowest=TRUE)

# the bin labels are character strings, even though they are generated with an operation the produces integers
# to see this enter the following lines of code
# 1:5
# class(1:5)
# 
# how examine h
# class(h)
# attributes(h)
# You can see that the values h takes on are "levels" that have character values "0" "1" "2" "3" "4" "5".  These are strings.
#To turn the strings into numbers, you coerce them with the "as" command

hits<-as(h,"numeric") - 1

# You can easily see the practical importance of this by trying
# mean(h) and then mean(hits)
#
# now product a histogram with the simulated data

hist(hits)

# calculate the mean and variance of the simulated data

samp.mean<-mean(hits)
samp.var<-var(hits)

# calculate the mean and variance of the distribution

hvec<-0:5
hvecsq<-hvec^2
mean<-sum(suz.pmf*hvec)
var<-sum(suz.pmf*hvecsq)-mean^2

# use ggplot to make a (much) better histogram
# make sure you understand how the two histrograms are different and why
#

library(ggplot2)
qplot(hits,binwidth=1)


