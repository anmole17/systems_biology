#Michaelis-Menten Equations
## linear model fit
#a)
S=c(0.5, 1.0, 1.5, 2.0, 4, 6, 8, 10, 15, 20, 25, 30, 40, 50, 75, 100)
V=c(0.16, 0.30, 0.42, 0.52, 0.85, 1.06, 1.22, 1.34, 1.54, 1.67, 1.75, 1.81, 1.90, 1.95, 2.03, 2.07)
plot(S,V,type="l",xlab="Substrate Concentration",ylab="Velocity")
print("From the plot Vmax is approximately 2 units and Km is 6")
#b)
S=c(2.5,5,10,15,20)
V=c(0.024,0.036,0.053,0.060,0.064)
plot(S,V,type="l",xlab="Substrate Concentration",ylab="Velocity")
print("From the plot Vmax is approximately 0.06mM/sec and Km is 5mM")
#c)
S=1/S
V=1/V
plot(S,V,type="l",xlab="Substrate Concentration",ylab="Velocity")
df=data.frame(S,V)
model<-lm(formula = V ~ S,data = df)
summary(model)