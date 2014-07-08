#This R script is while I am practicing the Exploratory Data Analysis:
#I am using boxplot, histograms 

library(datasets)
#Basic plot using the cars data.
colnames(cars)
data(cars)
with(cars, plot (speed, dist,main="CARS", col = "red", pch =8))

data(airquality)
colnames(airquality)
par (mfrow=c(3,1))
with (airquality, hist (Ozone, col = "grey", breaks=15))
with (airquality, rug (Ozone))
with (airquality, plot (x=Wind, y = Ozone, pch=8, main="Wind Vs Ozone", col="red"))

#The other Base plotting functions which to be used in conjunction with plot and hist
with (airquality, plot (Wind, Ozone, main = " Ozone in Newyork city"))
with (subset(airquality, Month == 5), points (Wind, Ozone, col="blue", pch=8))
with (subset(airquality, Month != 5), points (Wind, Ozone, col = "red", pch=8))
legend ("topright", pch=8, col = c("blue", "red"), legend = c("May", "Other Months"))

#Base plot with a Regression Line
par(mfrow=c(1,1))
with (airquality, plot (Wind, Ozone, main = " Ozone in Newyork City", pch =8, col="black"))
model = lm (Ozone ~ Wind, data=airquality)
abline (model, lwd = 2)
text (x=2,y=2, "*", col="grey")
legend ("topright", pch=8, legend =c("Ozone"), col="black")

#Multiple plots on a single device
par(mfrow=c(1,2))
with (airquality, {plot (Wind, Ozone, main = "Ozone in Newyork City", pch=8, col="black")
                   legend("topright", pch=8, col="black", legend=c("Wind"))
                   plot (Solar.R, Ozone, main = "Solar Vs Ozone", pch =8, col="red")
                   legend("topright", pch=8, col="red", legend=c("Solar.R"))
                   })
#Or we can have different fucntions called twice as below
with (airquality, plot (Wind, Ozone, main = "Ozone in Newyork City", pch=8, col="black"))
with (airquality, plot (Solar.R, Ozone, main = "Solar Vs Ozone", pch =8, col="red"))

#How to plot 3 graphs and usage of mtext ( Margin Text)
par(mfrow=c(1,3), mar=c(2,2,2,1), oma=c(0,0,2,0))

with (airquality, {plot (Wind, Ozone, main = "Wind Vs Ozone", pch=8, col="black")
                   plot (Solar.R, Ozone, main = "Solar Vs Ozone", pch =8, col="red")
                   plot (Temp, Ozone, main = "Temp Vs Ozone", pch =8, col="blue")
                   mtext("Climate changes in Newyork city", outer = TRUE)
})
#if you want to know what are the different options for points 
par(mfrow=c(1,1))
#Generating some values for the plot
x = rnorm (100)
y = x+ rnorm(100)
g = gl(n=2, k=50, label=c("Male", "Female"))
str(g)
#Just plot the x and y axis and not data points to be plotted
plot (x,y, type="n")
points (x[g == "Male"], y[g=="Male"], pch = 8, col="grey")
points (x[g == "Female"], y[g=="Female"], pch = 8, col="red")
legend("topleft", pch=8, col=c("grey", "red"),legend=c("Male", "Female"))
#The above plot will be copied into the pdf file 
dev.copy2pdf(out.type="pdf")

example(points)


#simple box plots
airquality = transform(airquality, Month = as.factor(Month))
colnames(airquality)
par(bg="grey")
boxplot(Ozone ~ Month, data=airquality, xlab="Month", ylab ="Ozone", pch=8)


#Lattice plots
library(lattice)
#loading the state data frame and adding a new column region.
state = data.frame(state.x77, region = state.region)
str(state)
xyplot (Life.Exp ~ Income | region, data= state, layout = c(4,1))


#ggplot2 function for graphs
library (ggplot2)
data(mpg)
colnames(mpg)
qplot( x=displ, y=hwy, data=mpg, main="Displ Vs Hwy") + geom_point()

