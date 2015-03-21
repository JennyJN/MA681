######### 1. Unknown Probability of Success ########
## Using built-in R pseudo-random number generator
theta_true <- runif(1,0,1)

## Generate population
N = sample(seq(100000,400000),1)
A = round(theta_true*N)
B = N - A
Zpop <- sample(c(rep(1,A),rep(0,B)))


### Pull random sample from population
N_samp <- 500
Zsamp <- sample(Zpop,N_samp)

betaplot <- function(a,b){
  theta = seq(0,1,0.005)
  p_theta = dbeta(theta, a, b)
  p <- qplot(theta, p_theta, geom='line')
  p <- p + theme_bw()
  p <- p + ylab(expression(paste('p(',theta,')', sep = '')))
  p <- p + xlab(expression(theta))
  return(p)}

### Function: Prior Plot Values
prior <- function(m,n){
  a = n * m
  b = n * (1 - m)
  dom <- seq(0,1,0.005)
  val <- dbeta(dom,a,b)
  return(data.frame('x'=dom, 'y'=val))
}

### Function: Likelihood Plot Values
likelihood <- function(N,Y){
  a <- Y + 1
  b <- N - Y + 1
  dom <- seq(0,1,0.005)
  val <- dbeta(dom,a,b)
  return(data.frame('x'=dom, 'y'=val))
}

### Function: Posterior Plot Values
posterior <- function(m,n,N,Y){
  a <- Y + (n*m) -1
  b <- N - Y + (n*(1-m)) - 1
  dom <- seq(0,1,0.005)
  val <- dbeta(dom,a,b)
  return(data.frame('x'=dom, 'y'=val))
}

### Function: Mean of Posterior Beta
mean_of_posterior <- function(m,n,N,Y){
  a <- Y + (n*m) -1
  b <- N - Y + (n*(1-m)) - 1
  E_posterior <- a / (a + b)
  return(E_posterior)
}

### Function: Mode of Posterior Beta
mode_of_posterior <- function(m,n,N,Y){
  a <- Y + (n*m) -1
  b <- N - Y + (n*(1-m)) - 1
  mode_posterior <- (a-1)/(a+b-2)
  return(mode_posterior)
}

### Function: Std Dev of Posterior Beta
sd_of_posterior <- function(m,n,N,Y){
  a <- Y + (n*m) -1
  b <- N - Y + (n*(1-m)) - 1
  sigma_posterior <- sqrt((a*b)/(((a+b)^2)*(a+b+1)))
  return(sigma_posterior)
}


m = 0.5
n = 2
pr <- prior(m,n)
lk <- likelihood(N_samp,Y_samp)
po <- posterior(m,n,N_samp,Y_samp)
model_plot <- data.frame('Dist'=c(rep('Prior',nrow(pr)), 
                                  rep('Likelihood',nrow(lk)), 
                                  rep('Posterior',nrow(po))),
                         rbind(pr,lk,po))
with(model_plot, Dist <- factor(Dist, levels = c('Prior', 'Likelihood',
                                                 'Posterior'), ordered = TRUE))
mean_po <- mean_of_posterior(m,n,N_samp,Y_samp)
mode_po <- mode_of_posterior(m,n,N_samp,Y_samp)
sd_po <- sd_of_posterior(m,n,N_samp,Y_samp)































