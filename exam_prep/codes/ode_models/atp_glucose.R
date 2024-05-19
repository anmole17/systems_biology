#The equations for the rate of change of ATP and glucose in the cell are as follows:
  # d[ATP]/dt=2*K1*[G]*[ATP]-((Kp*[ATP])/([ATP]+Km))
  # d[G]/dt = Vin − K1*[G]*[ATP]
  # The parameter values for the model are the following:
  # V in = 0.36, k 1 = 0.02, K p = 6 and K m = 13.
  # The concentrations of glucose and ATP were 6.6 and 7.6 units, respectively.
  # (a) Write a R code to simulate the system behaviour till 1000 mins of the reaction.
  # (b) Show the time profiles of Glucose and ATP concentrations in the same plot. Interpret
  # the results.
  # (c) Change the value of Km to 20. Run the simulation. What difference do you observe
  # between both the systems?
  library(deSolve)
#library(scatterplot3d)
Glu_ATP<-function(t,y,params)
{
  #change symbols
  Vin=params[1]
  k1=params[2]
  kp=params[3]
  km=params[4]
  G= y[1]
  ATP = y[2]
  dG = Vin -(k1*G*ATP)
  dATP=(2*k1*G*ATP)-((kp*ATP)/(ATP+km))
  list(c(dG,dATP))
  #In R, anything that is written lastly is automatically returned in the function
}
# CASE 1 --- Km = 13
initial=c(G=6.6,ATP=7.6)
parameters=c(0.36,0.02,6,13)
time=seq(0,1000)
out<-ode(times=time,y=initial,func=Glu_ATP,parms=parameters)
plot(out[,1],out[,2],col="blue",type="l",xlab="time",ylab="Concentration")
lines(out[,1],out[,3],col="red")
legend(x="topright",legend=c("Glucose","ATP"),col=c("blue","red"),lty=1,xpd=TRUE)
# CASE 2 --- Km = 20
initial=c(G=6.6,ATP=7.6)
parameters=c(0.36,0.02,6,20)
time=seq(0,1000)
out2<-ode(times=time,y=initial,func=Glu_ATP,parms=parameters)
plot(out2[,1],out2[,3],col="red",type="l",xlab="time",ylab="Concentration",ylim=c(1,10))
lines(out2[,1],out2[,2],col="blue")
legend(x="topright",legend=c("Glucose","ATP"),col=c("blue","red"),lty=1,xpd=TRUE)