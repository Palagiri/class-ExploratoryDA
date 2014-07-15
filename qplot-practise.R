#This file is with the ggplot2 library using qplot
#Loading the dataset.
library (ggplot2)
library(datasets)
data(mpg)
str(mpg)
colnames(mpg)
#qplot() plot displ-x and hwy-y 
qplot(x=displ, y=hwy, data=mpg) + ggtitle("Graph Displacement Vs High Way") +
        xlab("Displacement") + 
        ylab("High mileage") 


#qplot with subsetting with drv variable from the dataset
qplot(x=displ, y=hwy, data=mpg, color=drv) + ggtitle("Graph Displacement Vs High Way") +
        xlab("Displacement") + 
        ylab("High mileage") 

#adding a geom to the qplot
qplot( x=displ, y=hwy, data=mpg, geom = c("point", "smooth"))+ ggtitle("Graph Displacement Vs High Way") +
        xlab("Displacement") + 
        ylab("High mileage") 

#histogram using qplot
qplot(x=hwy, data=mpg, fill=drv)

#qplot using facets
#plot the graphs in different panels like lattice 1 ROW and multiple columns 
#facets ( ROW ~ COLUMNS) if we mention (.) that means we do not know how many ROWS we have.
qplot(hwy, displ, data=mpg, facets= . ~ drv , color =drv)

#plot the graphs in different panels like lattice 1 COL  and multiple ROWS on Histograms
qplot(hwy, data=mpg, facets= drv ~. , fill =drv,binwidth=2)

#use the density smooth
qplot(hwy, data = mpg, geom =c("density"), color = drv)

#qplot using shape
qplot(displ, hwy, data=mpg, color=drv,geom=c("smooth", "point"), method = "lm")









