#normality
#histogram
#qq plot
#shapiro-wilk test
size=c(25,22,28,24,26,24,22,21,23,25,26,
       30,25,24,21,27,28,23,25,24,20,22,24,23,22,24,20,19,21,22)
hist(size)
##skewness; modality; outliers
qqnorm(size)
qqline(size)
##dots hang tight around the reference line

shapiro.test(size)
##null hypothesis: the data is from a normal population
##alternative hypothesis: the data is not from normal population