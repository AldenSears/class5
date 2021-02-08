# EBIO 338/538 Class 05 R Base Graphics


#1a Load the Daphnia data from Class 04 and name the object daph
daph <- read.csv(file="Class_04_pHDaphnia.csv", stringsAsFactors = T)

#b Examine the structure of daph and the first five lines
str(daph)
head(daph)

#c Plot the relationship between growth rate and pH with growth rate on the y-axis
plot(daph$Growth.rate ~ daph$pH)

#d Make the axes labels more attractive
plot(daph$Growth.rate ~ daph$pH, xlab="pH", ylab="Growth rate", las=1)

#e Color code the different Clone types by adding points() for each subset in a different color. 
# Make them solid points of different shapes 
points(daph$Growth.rate[daph$Daphnia=="Clone2"] ~ daph$pH[daph$Daphnia=="Clone2"], col="blue", pch=18)
points(daph$Growth.rate[daph$Daphnia=="Clone3"] ~ daph$pH[daph$Daphnia=="Clone3"], col="red", pch=17)

#f Add a main label to the graph describing its contents (e.g., Daphnia growth rates by clone type relative to pH)
plot(daph$Growth.rate ~ daph$pH, xlab="pH", ylab="Growth rate", las=1, main="Daphnia growth rates by clone type relative to pH")
points(daph$Growth.rate[daph$Daphnia=="Clone2"] ~ daph$pH[daph$Daphnia=="Clone2"], col="blue", pch=18)
points(daph$Growth.rate[daph$Daphnia=="Clone3"] ~ daph$pH[daph$Daphnia=="Clone3"], col="red", pch=17)

#g Add three rows of text in the upper left corner of the plot where 
# each line specifies a Clone type (e.g., Clone1) in its respective color
plot(daph$Growth.rate ~ daph$pH, xlab="pH", ylab="Growth rate", las=1, main="Daphnia growth rates by clone type relative to pH")
points(daph$Growth.rate[daph$Daphnia=="Clone2"] ~ daph$pH[daph$Daphnia=="Clone2"], col="blue", pch=18)
points(daph$Growth.rate[daph$Daphnia=="Clone3"] ~ daph$pH[daph$Daphnia=="Clone3"], col="red", pch=17)
text(4.6, 6.6, "Clone1")
text(4.6, 6.4, "Clone2", col="blue")
text(4.6, 6.2, "Clone3", col="red")

#h Now repeat this figure 3 times within a multi-panel layout that has 1 row and 3 columns.
# Use different color schemes and point shapes in each iteration
par(mfrow=c(1, 3))

plot(daph$Growth.rate ~ daph$pH, xlab="pH", ylab="Growth rate", las=1, main="Daphnia growth rates by clone type relative to pH")
points(daph$Growth.rate[daph$Daphnia=="Clone2"] ~ daph$pH[daph$Daphnia=="Clone2"], col="blue", pch=18)
points(daph$Growth.rate[daph$Daphnia=="Clone3"] ~ daph$pH[daph$Daphnia=="Clone3"], col="red", pch=17)
text(4.6, 6.6, "Clone1")
text(4.6, 6.4, "Clone2", col="blue")
text(4.6, 6.2, "Clone3", col="red")

plot(daph$Growth.rate ~ daph$pH, xlab="pH", ylab="Growth rate", las=1, main="Daphnia growth rates by clone type relative to pH")
points(daph$Growth.rate[daph$Daphnia=="Clone2"] ~ daph$pH[daph$Daphnia=="Clone2"], col="purple", pch=3)
points(daph$Growth.rate[daph$Daphnia=="Clone3"] ~ daph$pH[daph$Daphnia=="Clone3"], col="pink", pch=4)
text(4.6, 6.6, "Clone1")
text(4.6, 6.4, "Clone2", col="purple")
text(4.6, 6.2, "Clone3", col="pink")

plot(daph$Growth.rate ~ daph$pH, xlab="pH", ylab="Growth rate", las=1, main="Daphnia growth rates by clone type relative to pH")
points(daph$Growth.rate[daph$Daphnia=="Clone2"] ~ daph$pH[daph$Daphnia=="Clone2"], col="green4", pch=7)
points(daph$Growth.rate[daph$Daphnia=="Clone3"] ~ daph$pH[daph$Daphnia=="Clone3"], col="orange", pch=8)
text(4.6, 6.6, "Clone1")
text(4.6, 6.4, "Clone2", col="green4")
text(4.6, 6.2, "Clone3", col="orange")


