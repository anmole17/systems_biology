library(deSolve)



## plot the glucose-insulin time profile data from experiment

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


model <- function (time, y, parms) {
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


 } else {

 dI = -n*I

 list(c(dX,dG,dI))

 }


})
}
 



## initial values for X,G,I

initial = c(0 ,279.11, 180)

#initial = c(0, 189, 50)

 # p1 = parms[1] = 0.02649
 # p2 = parms[2] = 0.02543
 # p3 = parms[3] = 1.28169 * e-5
 # Gb = params[4] = 90 (mg/dl)
 # Ib = params[5] = 7 (milli Units/day)
 # n = params[6] = 0.267
 # g = params[7] = 0.00407
 # h = params[8] = 83 (approximately same as GB)

parameters = c(0.02649, 0.02543, 1.2816e-5, 90, 7, 0.267, 0.00407, 83)

times = seq(0, 250, 1)

out <- ode (time = times, y = initial, func = model, parms = parameters)

plot(out)

X11()

#plot(out)

plot(data$time, data$glucose, xlab = "time(minutes)", ylab = "Glucose level in blood (mg/dl)" )
lines(out[,1],out[,3])

X11()


plot(data$time, data$insulin, xlab = "time(minutes)", ylab = "Insulin level in blood (mU/ml)" )
lines(out[,1],out[,4])

 

