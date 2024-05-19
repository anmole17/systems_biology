#The bacterial growth data representing size of the colony as a function of time is
# given below:
#
# t = {0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0}
# S = {2.2, 2.9, 3.2, 6, 6, 6.2, 8, 11, 14, 13, 18, 22, 21, 30, 35, 38, 47, 58, 70, 81, 90}
# Write an R script to fit a non-linear curve of the form S = Atα to this data. For this, perform
# log transform on both sides of the equation and do a linear fit between log(t) and log(S) to get
# the parameters t and α.
# defining the vectors
t = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0)
s = c(2.2, 2.9, 3.2, 6, 6, 6.2, 8, 11, 14, 13, 18, 22, 21, 30, 35, 38, 47, 58, 70, 81, 90)
# creation of data frames with log transformed values
df = data.frame(log(t), log(s))
df2 = subset(df[-1,])
names(df2)=c("t","s")
# performing linear model fitting
model = lm(formula=s ~ t, data=df2)
par(mfrow = c(2, 2))
plot(model,col="red")
# to visualise the linear fitting, observe PLOT no-2
