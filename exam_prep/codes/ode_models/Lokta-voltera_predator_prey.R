# The famous Lotka-Volterra predator-prey model in non-dimensional form is given
# by
# du/dτ= u(1 − v)
# dv/dτ= αv(u − 1)
# where u(τ ) is the non-dimensional prey population, v(τ ) is the non-dimensional predator
#population and α is a positive rate constant.
# (i) Using R, solve this differential equation for u(τ ) = v(τ ) = 1.3 and α = 0.1. Set τ end = 100.
# Plot u and v as functions of τ . Then plot u(τ ) versus v(τ ) (phase space trajectory) and see if
#you get a closed curve in the phase space.
# (ii) The system has two sets of fixed points, (0, 0) and (1, 1). Linearize the differential equation
# about these fixed points and show that the fixed point (0, 0) is a saddle point and the fixed
#point (1, 1) is a center (purely imaginary eigen values). Use R to do it.
library(deSolve)
library(scatterplot3d)
#(i)
lotka_voltera<-function(t,y,params)
{
  #change symbols
  u=y[1]
  v=y[2]
  a=params[1]
  du=u*(1-v)
  dv=a*v*(u-1)
  list(c(du,dv))
  #In R, anything that is written lastly is automatically returned in the function
}
initial=c(u=1.3,v=1.3)
parameters=c(0.1)
time=seq(0,100,0.1)
out<-ode(times=time,y=initial,func=lotka_voltera,parms=parameters)
plot(out)
df=as.data.frame(out)
plot(df$time,df$u,type="l",col="blue",xlab="Time",ylab="")
lines(df$time,df$v,col="red",type="l")
legend("topleft",legend=c("u","v"),col=c("blue","red"),lty=1)
matplot(df$u,df$v,xlab="u",ylab="v")
#(ii)
library(rootSolve)
#Defining the functions
f= expression(u*(1-v))
g=expression(a*v*(u-1))
#Differentiation of both functions with respect to u and v
a11=D(f,"u")
a12=D(g,"u")
a21=D(f,"v")
a22=D(g,"v")
#Define the operating points (1st case)
u=v=0
a=0.1
#Evaluate the elements for the given values of operating points
a11_n=eval(a11)
a12_n=eval(a12)
a21_n=eval(a21)
a22_n=eval(a22)
#Creation of a Jacobian matrix
Jacobian<-matrix(c(a11_n,a12_n,a21_n,a22_n),nrow=2,ncol=2)
J_eigen<-eigen(Jacobian)
#Define the operating points (2nd case)
u=v=1
a=0.1
#Evaluate the elements for the given values of operating points
a11_n=eval(a11)
a12_n=eval(a12)
a21_n=eval(a21)
a22_n=eval(a22)
#Creation of a Jacobian matrix
Jacobian<-matrix(c(a11_n,a12_n,a21_n,a22_n),nrow=2,ncol=2)
J_eigen<-eigen(Jacobian)