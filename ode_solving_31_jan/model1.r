# Numerically solve logistic eqn
# (dN/dt) = r*N*(1-(N/t))
# Analytical Solution-> N(t)=k*N(0)*((e^(r*t)/(k+N(0)*(e^(rt)-1)))) 

# library
# install.packages("deSolve")
library(deSolve)

model<-function(times,y,params){
  N<-y
  r<-params[1]
  k<-params[2]
  dN<-r*N*(1-(N/k))
  return(list(dN))
}

# initial value 
y<-0.1
# parameters( r=0.1, k=10)
r<-0.1
k<-10
params<-c(r,k)

# time range for solution
times<-seq(0,100,1)

# call 'ode' function from library "deSolve"
out<-ode(y,times,model,params)

#par(mfrow = c(2, 2))
# overloaded function for ode
plot(out, xlab="Time(t)", ylab="N(t)", color='red', main="Numerically Solve Logistic Eqn (dN/dt) = r*N*(1-(N/t))")

#summary
print(out)
print(summary(out))

# change params
r<-0.2
k<-10
params<-c(r,k)
out2<-ode(y,times,model,params)
lines(out2, xlab="Time(t)", ylab="N(t)", col='blue', lty=2)

r<-0.3
k<-10
params<-c(r,k)
out3<-ode(y,times,model,params)
lines(out3, xlab="Time(t)", ylab="N(t)", col='green', lty=3)

legend(80,4,legend=c("r=0.1","r=0.2","r=0.3"), col=c("red","blue","green"),
       lty=c(1,2,3), ncol=1)
