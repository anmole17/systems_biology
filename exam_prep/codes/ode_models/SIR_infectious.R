# An infectious disease model consists of the following variables:
# S(t) = number of susceptible individuals at time t
# I(t) = number of infectious individuals at time t
# R(t) = number of individuals died at time t
# with N(t) = S(t) + I(t) + R(t) = total number of individuals = constant
# This model (called ’SIR model) is represented by a set of ordinary differential equations,
# dS/dt = (-b*S*I)/N
# dI/dt = (b*S*I)/N - (c*I)
# dR/dt = c*I
# Solve the above equation in R for b= 2, c=0.2 with the initial conditions :
# S(0) = 99, I(0) = 1 and R(0) = 0
# with the condition that
# Plot the three variables S, I and R as a function of time on the same graph. Interpret the
#results.
library(deSolve)
library(scatterplot3d)
SIR_model<-function(t,y,params)
{
  #change symbols
  b=params[1]
  c=params[2]
  S = y[1]
  I = y[2]
  R = y[3]
  N = (S+I+R)
  dS = (-b*S*I)/N
  dI = (b*S*I)/N - (c*I)
  dR = c*I
  list(c(dS,dI,dR))
  #In R, anything that is written lastly is automatically returned in the function
}
initial=c(S=99,I=1,R=0)
parameters=c(2,0.2)
time=seq(0,20,0.1)
out<-ode(times=time,y=initial,func=SIR_model,parms=parameters)
plot(out)
scatterplot3d(out[,-1])
df=as.data.frame(out)
plot(df$time,df$S,type="l",col="blue",xlab="Time (mins)",ylab="")
lines(df$time,df$I,col="red")
lines(df$time,df$R,col="green")
legend(x="topright",legend=c("S","I","R"),col=c("blue","red","green"),lty=1,xpd=TRUE)