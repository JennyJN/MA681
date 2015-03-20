# plots of the binomial distribution n=20, p=.2
# note the plot type

x<-1:20
plot(x,pbinom(x,size=20,prob=.2),type="s",ylab="F(x)", main="Binomial(20, 0.2) CDF")
plot(x,dbinom(x,size=20,prob=.2),type="s",ylab="p(x)", main="Binomial(20, 0.2) pmf")
plot(x,dbinom(x,size=20,prob=.2),type="h",ylab="p(x)", main="Binomial(20, 0.2) pmf")
plot(x,dbinom(x,size=20 ,prob=.2),type="o",ylab="p(x)", main= "Binomial(20, 0.2) pmf")
 