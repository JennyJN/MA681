# CDFs and probability mass functions for the Poisson distribution

x <- seq(-0.01, 5, 0.01)
plot(x, ppois(x, 1), type="s", ylab="F(x)", main="Poisson(1) CDF")
plot(x, dpois(x, 1), type="s", ylab="p(x)", main="Poisson(1) pmf")

lambda<-3

y<-seq(0,10,1)
plot(y, ppois(y, lambda), type="s", ylab="F(y)", main="Poisson(lambda) CDF")
plot(y, dpois(y, lambda), type="h", ylab="p(y)", main="Poisson(lambda) pmf")

# Make sure you scroll through the plots.

# now Simulate!
seed=0xB52
set.seed(seed)
n<-2000
sim<-rpois(n,lambda)
hist(sim)

# You will see warnings when you run this -- lots of them.  Why?  Make sure you know.
