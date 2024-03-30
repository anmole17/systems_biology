# example 1 is done in notebook; 
# here is example 2: needs numerical solve

## step 1 solve the equations ODE
# Cooperative inhibition
# eq1:dS1<-(k1/(1+(S2/M2)^n1))-k3*S1
# eq2:dS2<-(k2/(1+(S1/M1)^n2))-k4*S2
# n1=n2=2
library("deSolve")
model<-function(times,y,params){
  n1<-params[1] 
  n2<-params[2] 
  M1<-params[3]
  M2<-params[4]
  k1<-params[5]
  k2<-params[6]
  k3<-params[7]
  k4<-params[8]
  S1=y[1]
  S2=y[2]
  dS1<-(k1/(1+(S2/M2)^n1))-k3*S1
  dS2<-(k2/(1+(S1/M1)^n2))-k4*S2
  return(list(c(dS1,dS2)))
}
# set initial values
initial<-c(y1=3, y2=1)
# parameters
# n1=n2=2
# M1=M2=1
# k1=k2=20
#k3=k4=5
n1<-2
n2<-2
M1<-1
M2<-1
k1<-20
k2<-20
k3<-5
k4<-5
params<-c(n1,n2,M1,M2,k1,k2,k3,k4)

times<-seq(from=0, to=5, by=0.01)
# ODE calculation 
out<- ode(times=times,y=initial ,parms=params,func=model)
# a. number of predator and prey as function of time.
X11()
plot(out[,1], out[,2], type='l', ylim=c(0,4), xlab = "Time",
     ylab = "S", col="blue",main="Cooperative inhibition: Enzyme ")
lines(out[,1], out[,3], col='red' )
legend(0, 5, legend=c("S1", "S2"),
       col=c("blue", "red"), lty=1,cex=0.8)

## 3 solutions S1=0, S2=3.6; S1=3.6, S2=0;S1=0, S2=0
## Step 2: Jacobian matrix : done in notebook
# Step 3: Solving Steady State eq
fun2<- function(x){
  
  f1<-20/(1+x[2]^2) - 5*x[1]
  f2<-20/(1+x[1]^2) - 5*x[2]
  c(F1=f1,F2=f2)
}
sol1<- multiroot(fun2,start=c(0,0))
sol1 # $root
#[1] 1.378797 1.378797
sol2<- multiroot(fun2,start=c(3.73,0.26))
sol2
# $root
# [1] 3.7320508 0.2679492
sol3<- multiroot(fun2,start=c(0.26,3.73))
sol3
#$root
#[1] 0.2679492 3.7320508

#  Step 4: ## find eigen values of the three jacobian matrix
# j<- (-40*1.378)/((1+1.378^2))^2
# j
# [1] -6.55915
## j<- (-40*0.2679492 )/((1+0.2679492 ^2))^2
# j
# [1] -9.330127
## j<- (-40*3.7320)/((1+3.7320^2))^2
# j
# [1] -0.6698979

J1<-matrix(c(-5,-6.559,-6.559,-5),2,2)
J2<-matrix(c(-5,-9.33,-0.6698,-5),2,2)
J3<-matrix(c(-5,-0.6698,-9.33,-5),2,2)
eigen(J1)
##$values
# [1]   1.559 -11.559
eigen(J2) 
# $values
# [1] -7.47394 -2.52606   ## stable: both eigen val are  -ve
eigen(J3)
# $values
# [1] -7.47394 -2.52606   ## stable