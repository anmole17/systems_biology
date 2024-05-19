## Open Reaction network(refer to notebook for details):
## dA<-k1-k2*A-k3*A*B
## dB<-k2*A-k3*A*B
## dC<-k3*A*B-k4*C
## dD<-k3*A*B-k5*D

library("deSolve")
model<-function(times,y,params){
  k1<-params[1] 
  k2<-params[2] 
  k3<-params[3]
  k4<-params[4]
  k5<-params[5]
  A=y[1]
  B=y[2]
  C=y[3]
  D=y[4]
  
  dA<-k1-k2*A-k3*A*B
  dB<-k2*A-k3*A*B
  dC<-k3*A*B-k4*C
  dD<-k3*A*B-k5*D

  return(list(c(dA,dB,dC,dD)))
}
# set initial values
initial<-c(A=0, B=0,C=0, D=0)
# parameters
k1<-3
k2<-2
k3<-2.5
k4<-3
k5<-4
params<-c(k1,k2,k3,k4,k5)

times<-seq(from=0, to=4, by=0.01)
# ODE calculation 
out<- ode(times=times,y=initial ,parms=params,func=model)
# a. number of predator and prey as function of time.
X11()
plot(out[,1], out[,2], type='l', ylim=c(0,1), xlab = "Time",
     ylab = "Conc.", col="blue",main="Open Reaction network ")
lines(out[,1], out[,3], col='red' )
lines(out[,1], out[,4], col='green')
lines(out[,1], out[,5], col='black')
text(3,0.4,"D",col="black")
text(3,0.52,"C",col="green")
legend(0, 1, legend=c("A", "B","C","D"),
       col=c("blue", "red","green","black"), lty=1,cex=0.8)

## Step 2: Solving steady state
A<-k1/(2*k2)
B<-k2/k3
C<-k1/(2*k4)
D<-k1/(2*k5)

## solving jacoian

J<-matrix(c((-k2-k3*B),(-k3*A),0,0,
            (k2-k3*B),(-k3*A),0,0,
            (k3*B),(k3*A),(-k4),0,
            (k3*B),(k3*A),0,(-k5)
            ),4,4)
J
# [,1]   [,2] [,3] [,4]
# [1,]   -4 -1.875    0    0
# [2,]    0 -1.875    0    0
# [3,]    2  1.875   -3    0
# [4,]    2  1.875    0   -4
eigen(J) 
# $values
# [1] -4.000 -4.000 -3.000 -1.875
J<-t(J)
# # J
# [,1]   [,2]   [,3]   [,4]
# [1,] -4.000  0.000  2.000  2.000
# [2,] -1.875 -1.875  1.875  1.875
# [3,]  0.000  0.000 -3.000  0.000
# [4,]  0.000  0.000  0.000 -4.000
eigen(J)
# $values
# [1] -4.000 -4.000 -3.000 -1.875

paste("As all eighen values are -ve it is a steady state")
