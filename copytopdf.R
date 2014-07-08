library(datasets)
colnames(faithful)
head(faithful, 5)
with (faithful,plot(eruptions, waiting, pch=8, col="grey") )
title ("Old Faithful Geyser Data")
example(points)
#plotting a plot in a file for eg pdf
pdf (file="myplot.pdf")
with (faithful,plot(eruptions, waiting, pch=8, col="grey") )
title ("Old Faithful Geyser Data")
dev.off()

#The other way of doing it is once the file is created we can just do a 
dev.copy2pdf(out.type ="pdf")
