
library(ggplot2)

theta = seq(0,1,0.005)
d_theta=dgamma(theta,shape=3,rate=10)
p<-qplot(theta, d_theta, geom = "line")
p

