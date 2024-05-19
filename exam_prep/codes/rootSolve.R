library("rootSolve")

# 1: Solve (Cos(2x))^3
cos2x<- function(x){
  return (cos(2*x))^3
}
sol<- uniroot.all(cos2x,c(0,2*pi))
sol

# fun goes to infinity: eg tan(x) 
tanx<- function(x){
  return (tan(x))
}
sol2<- uniroot.all(tanx,c(0,2*pi))
sol2

# 2: Solve inhomogenous simultaneous eq.
# x+y+z^2=12
# x^2-y+z=2
# 2*x-y^3+z=1
fun2<- function(x){
  
  f1<-x[1]+x[2]+x[3]^2-12
  f2<-x[1]^2-x[2]+x[3]-2
  f3<-2*x[1]-x[2]^3+x[3]-1
  c(F1=f1,F2=f2,F3=f3)
  }
sol3<- multiroot(fun2,start=c(1,1,1))
sol3

# x<-c(-0.07147916,1.28880718,3.28369791)
# 2*x[1]-x[2]^3+x[3]
# [1] 1
# > x[1]^2-x[2]+x[3]
# [1] 2
# > x[1]+x[2]+x[3]^2
# [1] 12

# solve 3: 