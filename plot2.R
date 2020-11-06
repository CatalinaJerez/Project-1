# Course:  Course: Exploratory Data Analysis
# Author:  Catalina Jerez 
# Project: 1 - plot2

# Set working directory

setwd("~/Google Drive/Coursera") # Set working directory

### Part 1

#load and clean the data
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ';', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), na.strings = '?')

data$Date <- as.Date(data$Date, '%d/%m/%Y') # Format date

data.sub  <- subset(data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02')) # We select the data or our interest 
data.sub  <- data.sub[complete.cases(data.sub), ] # remove the incomplete cases

Date.Time <- paste(data.sub$Date, data.sub$Time)
Date.Time <- setNames(Date.Time, 'Date.Time')

data.sub <- data.sub[ ,!(names(data.sub) %in% c('Date', 'Time'))] # Remove the old Date and Time
data.sub <- cbind(data.sub, Date.Time) # Put the new date time format

data.sub$Date.Time <- as.POSIXct(Date.Time) # Change the format 

### Part 2

# Making plots

# Plot 2
with(data.sub, plot(Global_active_power~Date.Time, type = 'l', col = 'black', xlab = ' ', ylab = 'Global Active Power (kilowatts)'))

dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()