library(deSolve)

data = read.csv("glucose_insulin_profile_data.csv", header = TRUE)

plot(data$time, data$glucose, xlab = "time(minutes)", ylab = "Glucose level (mg/dl)" )

X11()

plot(data$time, data$glucose, xlab = "time(minutes)", ylab = "Insulin Level (mU/ml)" )

## differential equations

## y[1] is X, Plasma insulin
## y[2] is G, Plasma Glucose
## y[3] is I, Intersticial insulin

## Gb = basal plasma glucose concentration
## Ib = basel plasma insulin concentration
## n = insulin clearance fraction
## g = secondary pancreatic response to glucose
## h = basel glucose plasma level


min_model <- function (time, y, parms) {
  with(as.list(c(y, parms)), {
    p1 = parms[1] 
    p2 = parms[2]
    p3 = parms[3]
    Gb = parms[4]
    Ib = parms[5]
    n = parms[6]
    g = parms[7]
    h = parms[8]
    X = y[1]
    G = y[2]
    I = y[3]
    dX <- -p2*X + p3*(I - Ib)
    dG <- (-X * G) + p1*(Gb - G)
    
    if(G > h){
      dI = (-n*I) + g*(G - h)*time
      list(c(dX,dG,dI))
    }else {
      dI = -n*I
      list(c(dX,dG,dI))
    }
  })
}


## initial values for X,G,I
initial <- c(0 ,291.224, 364.835)

times= seq(0, 182, 0.01)

# parameters
p1<- 0.03168360775
p2<- 0.0123362991
p3<- 4.891692162e-06
Gb<- 90
Ib<- 7 
n <- 0.2658844452
g <- 0.003911687955
h <- 79.03532257

params<-c(p1,p2,p3,Gb,Ib,n,g,h)

out <- ode(time = times, y = initial, func = min_model, parms = params)

plot(model_data$time, model_data$insulin, xlab = "Time(min.)", ylab = "Insulin Level (μU/ml)",main="Bergmans Minimal Model:\nI(t):Insulin Level in plasma(μU/ml)", ylim=c(0,150) )
lines(out[,1],out[,4])
abline(h=7,lty=2)

plot(out[,1],out[,2], xlab = "Time(min.)", ylab = "Interstitial insulin", main="Bergmans Minimal Model:\nX(t):Interstitial insulin level", type='l')

plot(model_data$time, model_data$glucose, xlab = "Time(min.)", ylab = "Plasma Glucose level(mg/dl)", main="Bergmans Minimal Model:\nG(t):Plasma Glucose level(mg/dl)" )
lines(out[,1],out[,3])
abline(h=90,lty=2)