#Q1: dN/dt= rN*(1-(N/K))
## solution: Nt_b=(Nt[1]*exp(r*t))/(1+(Nt[1]/K)*(exp(r*t)-1)
library(deSolve)
# parameters
r<-0.0312
K<-198.6

## a. plot time versus population in a graph
# data for the US census
t<-c(0,10,20,30,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230)
Nt<-c(3.9,5.3,7.2,9.6,12.9,17.8,23.2,31.4,38.5,50.2,62.9,76.2,92.2,
      106.2,123.2,132.2,151.3,179.3,203.3,226.5,248.7,281.42,308.7)
plot(t,Nt,xlab="Time(in years)", ylab="Population(Nt)in millions", 
     main="Time vs Population(in Millions)", col="red", type='p',)
## b. For the values r = 0.0312 and K = 198.6, compute N(t) as a function of t using above
#solution formula. Plot this curve on the same plot along with data points. Upto which year, the fit
#is good? Is the logistic equation is good model for this population growth data?. Comment.

Nt_b<- (Nt[1]*exp(r*t))/(1+(Nt[1]/K)*(exp(r*t)-1))
lines(t,Nt_b, col="blue")
                