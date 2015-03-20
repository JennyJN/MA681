


seed=35
s<-set.seed(seed)
N<-50

n1<-rnorm(N)

x1<-runif(N,min=0,max=1)
hist(x1,main="x1 is n(1,0)")
x2<-runif(N,min=0,max=1)
x3<-runif(N,min=0,max=1)
xx<-x1+x2
hist(xx)
xxx<-xx+x3
hist(xxx)
x4<-runif(N,min=0,max=1)
x5<-runif(N,min=0,max=1)
xxxxx<-xxx+x4+x5
hist(xxxxx)

x <- seq(-4, 4, length=100)
hx <- dnorm(x)
plot(x,hx,type="l")
qqnorm(xxxxx)
qqnorm(x1)
qqnorm(xx)
qqplot(xxxxx,x1)
y<-seq(0,2,length=100)
plot(y)
hy<-dunif(y,min=0,max=2)
plot(y,hy,type="l")
qqplot(hy,xx)
z1<-seq(0,1,length=100)
z2<-2-seq(1,2,length=100)
z<-c(z1,z2)
plot(z)
qqplot(z,xx)

