# EBIO338/358: Analysis and Visualization of Biological Data
# Class 5: Base Graphics

# Load the temperature data from last class
temp <- read.csv(file="temperature_data.csv")

# Explore the structure and contents
str(temp)
range(temp$month)
range(temp$yr)
table(temp$month, temp$yr)

# Is this a tidy dataset?
head(temp)
head(temp, 35)


# Create a histogram of temperature
hist(temp$temperature)
hist(temp$temperature, probability = T)
# Question: What's meant by frequency versus density?

# A way to think about density:

# What values are between 0 and 5?
temp0_5 <- temp$temperature[temp$temperature > 0 & temp$temperature <= 5]
# What proportion of the values is this?
prop0_5 <- length(temp0_5) / length(temp$temperature)
# What is the density? In other words, portion of values per unit of the variable
dens0_5 <- prop0_5 / (5 - 0)
abline(h = dens_0_5)
# Check that we get the same values as the histogram shows
hist_vals <- hist(temp$temperature, probability = T)
hist_vals$density
hist_vals$density[3]


# Create a plot of temperature over time using plot()
plot(temp$temperature ~ temp$yr)

# There are two different ways to specify the x and y variables. 
# Either as above using the tilde (i.e., y ~ x) or using a comma to 
# separate x, y. Note the order differs!
# The tilde can be read as "as a function of". We will use this format for 
# modeling, so it's worth getting used to.
plot(temp$temperature ~ temp$yr)
plot(temp$yr, temp$temperature) 
# For clarity, x and y can be specified in which case the order does not matter
plot(x=temp$yr, y=temp$temperature)
plot(y=temp$temperature, x=temp$yr)

# Change the x-axis and y-axis labels so they are easier to read
plot(temp$temperature ~ temp$yr, xlab="Year", ylab="Temperature", 
     las=1)

# Change the point type using pch
plot(temp$temperature ~ temp$yr, xlab="Year", ylab="Temperature", 
     pch=2, las=1)

# Change the point color using col
plot(temp$temperature ~ temp$yr, xlab="Year", ylab="Temperature", 
     col="blue", las=1)

# There are multiple ways to save a copy of a plot. 
# You can click the export button under the plots header
# Or write the plot to a file directly using code

pdf(file="Rplot1.pdf", width=7, height=7)
plot(temp$temperature ~ temp$yr, xlab="Year", ylab="Temperature", col="blue")
dev.off()
# Question: What would this do in a .Rmd file?

# Similar functions exist for writing figures to other files types, such as .png, .jpeg, .tiff

# Now let's explore relationships between different variables
# Look at the first few lines as a reminder of what data we have
head(temp) 

# We can plot daily temperature highs and lows on the same plot, but need to ensure the axes work with the data
plot(temp$temperature ~ temp$yr, xlab="Year", ylab="Temperature", col="red", las=1)
plot(temp$lower ~ temp$yr, xlab="Year", ylab="Temperature", col="blue", las=1)

# How do the ranges of the two variables compare?
range(temp$temperature)
range(temp$lower)

# We can set the limits of the x and/or y axis to ensure all data will be displayed using xlim and ylim
plot(temp$temperature ~ temp$yr, xlab="Year", ylab="Temperature", 
     col="red", ylim=c(-15, 40), las=1)

# If we call another plot, then the current plot will be overwritten. 
# Instead, we can add additional information to plots using the function points()
points(temp$lower ~ temp$yr, col="blue", pch=2)

plot(temp$lower ~ temp$temperature, xlab="Temperature", ylab="Lower", 
     xlim=c(-15, 40), ylim=c(-15, 40), las=1)
?abline
abline(a=0, b=1)

# #1 TO DO: a) Plot the relationship between rainfall and temperature 
# with temperature on the x-axis
# b) Rename the xaxis and yaxis lables to read "Rainfall" and "Temperature". Make sure the y-axis labels are horizontal.
# c) Change the color of the points so that they aren't black (your pick of color)
# d) Save the plot as a .jpeg using two different methods


# The apply family of functions are very useful for summarizing data for plotting and are part of base R

# We use tapply() to split our data into groups defined by some classifying factor (a.k.a. index, below, we use month), 
# compute a function on each group, and return the results. The basic structure here is:
# tapply(vector, index, function)
?tapply
tapply(temp$temperature, temp$month, min)
tapply(temp$temperature, temp$month, mean)
tapply(temp$temperature, temp$month, var)


# Use a list to summarize across multiple index variables e.g.:
# We can use the with() function to avoid using the data$column repetition

mean_temps <- with(temp, tapply(temperature, list(yr, month), mean))
head(mean_temps)
str(mean_temps)

# Let's examine monthly temperature means from 1987
plot(1:12, mean_temps[1, ], main="1987 monthly mean temperatures")

# And make the labels more attractive
plot(1:12, mean_temps[1, ], main="1987 monthly mean temperatures", 
     xlab="Month", ylab="Mean temperature (degrees C)", las=1)
plot(1:12, mean_temps[1, ], main="1987 monthly mean temperatures", 
     xlab="Month", ylab="Mean temperature (degrees C)", las=1, pch=16)

# We can change the size of the points using cex, which has a default size of 1
plot(1:12, mean_temps[1, ], main="1987 monthly mean temperatures", 
     xlab="Month", ylab="Mean temperature (degrees C)", las=1, pch=16, cex=1.2)
plot(1:12, mean_temps[1, ], main="1987 monthly mean temperatures", 
     xlab="Month", ylab="Mean temperature (degrees C)", las=1, pch=16, cex=1.5)

# We can add lines connecting the points with using lines(), which is analogous to how we added points in line 52
lines(1:12, mean_temps[1, ])

# Just as the point type can be specified by pch and its size by cex, the line type can be specified by lty and its size by lwd
plot(1:12, mean_temps[1, ], main="1987 monthly mean temperatures", 
     xlab="Month", ylab="Mean temperature (degrees C)", las=1, pch=16)
lines(1:12, mean_temps[1, ], lty=2)
lines(1:12, mean_temps[1, ], lty=2, lwd=6)

# Most people can intuit that months 1-12 are Jan - Dec, but let's rename the axis labels to make that clear
# First, we must suppress axis labels on the base plot using xaxt
plot(1:12, mean_temps[1, ], xaxt = "n", main="1987 monthly mean temperatures", 
     xlab="Month", ylab="Mean temperature (degrees C)", las=1, pch=16)
# Then add labels using axis() and providing the new labels
axis(side=1, at=1:12, labels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
# And rotate the labels so that they are visible using las
axis(side=1, at=1:12, labels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), las=2)

# Let's put it all together now
plot(1:12, mean_temps[1, ], xaxt = "n", main="1987 monthly mean temperatures", 
     xlab="Month", ylab="Mean temperature (degrees C)", las=1, pch=16)
lines(1:12, mean_temps[1, ], lty=2, lwd=1)
axis(side=1, at=1:12, labels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), las=2)

# Lastly, we can add text within a plot using text() or text outside of a plot in the margins using mtext()
text(x=3, y=20, "Look I made a plot!!", font=4, col="purple", cex=1.5)
mtext("(a.k.a. my FANCY plot)", side=3, line=0, col="red", font=2)

# #2 TO DO: a) Plot the yearly minimum temperature 
# b) Make the labels more attractive
# Set the points as solid green triangles and increase their size to 2
# Connect the points with a green dotted line
# Add text in your favorite color to the lower right corner describing what 
# seems to be happening to minimum yearly temperature over time

# So far, we have used graphical parameters as arguments within high-level plot functions
# There are additional graphical parameters than can only be set through par(), 
# which mostly have to do with plot dimensions and spacing

# To create a multi-panel plot, set the number of panels using mfrow or mfcol
par(mfrow = c(1, 2))
plot(1:12, mean_temps[1, ])
plot(1:12, mean_temps[2, ])

par(mfrow = c(2, 1))
plot(1:12, mean_temps[1, ])
plot(1:12, mean_temps[2, ])

# Notice that the multi-panel figure has a lot of empty white space. 
# This can be reduced by changing the inner margins within par using mar()
# The default settings for mar = c(5, 4, 4, 2) lines for sides c(bottom, left, top, right)
par(mar=c(3, 2, 2, 1))
plot(1:12, mean_temps[1, ])
plot(1:12, mean_temps[2, ])

# To restore the default settings in par, call par again and return the number 
# of panels to 1 x 1 and the margins to c(5, 4, 4, 2)
par(mfrow = c(1, 1), mar=c(5, 4, 4, 2))
plot(1:12, mean_temps[1, ])




# What happens when we have an x axis that's not numeric?
temp$summer <- ifelse(temp$month == 6 | temp$month == 7 | temp$month == 8,
                      "summer", "not_summer")
temp$summer <- as.factor(temp$summer)

plot(temp$temperature ~ temp$summer)


# #3 TO DO: Play around with the margins to minimize the amount of white space 
# in between panels but ensure the x-axis and y-axis labels are visible



