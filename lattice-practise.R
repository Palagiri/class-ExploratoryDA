#Scatterplotting practice Week-2 EDA
library (lattice)
library(datasets)
data(airquality)
head (airquality)

#plotting the scatter plot from the lattice plotting
xyplot(Ozone ~ Wind, data=airquality )
#In base plotting system that is as follows
with (airquality, plot(Wind, Ozone, col="blue"))

#Plotting the lattice plotting for a particular month using the lattice plotting.
colnames(airquality)
class(airquality$Month)
airquality$Month <- as.factor(airquality$Month)
p = xyplot(Ozone ~ Wind | Month, data=airquality, layout = c(5,1))
print(p)


#Similar graph plotting in base plotting
summary(airquality$Month)
par(mfrow=c(1,5))
airquality5 = subset(airquality,  airquality$Month == "5")
airquality5
with (airquality5, plot (Wind, Ozone, col = "blue")) + title("Month 5")


airquality6 = subset(airquality,  airquality$Month == "6")
airquality6
with (airquality6, plot (Wind, Ozone, col = "blue")) + title("Month 6")

airquality7 = subset(airquality,  airquality$Month == "7")
airquality7
with (airquality6, plot (Wind, Ozone, col = "blue")) + title("Month 7")


airquality8 = subset(airquality,  airquality$Month == "8")
airquality8
with (airquality8, plot (Wind, Ozone, col = "blue")) + title("Month 8")


airquality9 = subset(airquality,  airquality$Month == "9")
airquality9
with (airquality9, plot (Wind, Ozone, col = "blue")) + title("Month 9")

#Lattice Panel functions
set.seed(10)
x = rnorm (100)
f = rep(0:1, each=50)
y = x + f - x * f + rnorm (100, sd=0.5)

f = factor(f, labels=c("Grp1", "Grp2"))
xyplot ((x ~ y | f), layout=c(2,1))

#Custom panel function :

xyplot(x ~ y | f, panel = function(x,y,...) {
        panel.xyplot(x,y,...)
        panel.abline(h = median(y), lty=2)
})




