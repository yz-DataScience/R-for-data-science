#Frustration is natural when you start programming in R, 
#because it is such a stickler for punctuation,
#and even one character out of place will cause it to complain.
#But while you should expect to be a little frustrated, 
#take comfort in that it’s both typical and temporary:
#it happens to everyone, and the only way to get over it is to keep trying.

#chapter 4 of R for data science
#basics of R
#1. USE R as a calculator
3+2
332+555
332*555
332^3
80/16

80+3*5

#2. create new objects

#object_name<-value
#object_name=value
x=2
x
x=c(1,2,5,3,6,9)
x
x*3
y=1:6
y  
x+y
household_income=c(100,70,88,190)
household.income=c(100,70,88,190)

##letters,numbers,_,. for object names

Household_income
household_income

##quotations and parentheses must always come in a pair.

income=c(100,800)


### seq(), rep()

x=seq(5,100,by=5)
x

y=rep(3,100)

y


