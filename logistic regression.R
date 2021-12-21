install.packages("Stat2Data")
library("Stat2Data")
data("MedGPA")
?MedGPA
names(MedGPA)
#Q1: how to model on acceptance(0/1) using GPA (Q)?
plot(Acceptance~GPA,data=MedGPA)
lm1=lm(Acceptance~GPA,data=MedGPA)
abline(lm1)
#logistic regression (binary response)
glm(Acceptance~GPA,data=MedGPA,family=binomial)
#log(pie/(1-pie))=-19.207  +5.454*GPA

GPA=3
-19.207  +5.454*3
#for students with GPA being 3,
##the probability of getting acceptance is 5.6%

### odds =probability of success (1)/probability of failure (0)
#log(odds)=-19.207  +5.454*GPA

##As GPA goes up by 1, the log(odds) increase by 5.454.

##As GPA goes up by 1, the odds increase by 233.
#the probability of acceptance over the probability of rejection 
#increases by 233 if students' GPA goes up by 1.

###Q2: How to predict acceptance using GPA and MCAT and Sex?
names(MedGPA)

glm2=glm(Acceptance~GPA+MCAT+Sex,data=MedGPA,family=binomial)

summary(glm2)

coef(glm2)

exp(coef(glm2))

###model comparison

glm0=glm(Acceptance~1,data=MedGPA,family=binomial)

anova(glm0,glm2,test="Chisq")

glm1=glm(Acceptance~GPA,data=MedGPA,family=binomial)
glm2=glm(Acceptance~GPA+MCAT+Sex,data=MedGPA,family="binomial")

anova(glm1,glm2,test="Chisq")
