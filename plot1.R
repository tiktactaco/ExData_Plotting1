## Script for Exploratory Data Analysis Class Project 1
## Creates plot1.png

library(tidyverse)
library(lubridate)

temp <- tempfile()
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, temp)
epcdata <- read_delim(temp, delim=';', na=c("", "?"))
unlink(temp)

epcdata$Date <- dmy(epcdata$Date)
epcdata <- subset(epcdata, Date=="2007-02-01" | Date=="2007-02-02")

png(filename = "plot1.png", width = 480, height = 480)

hist(epcdata$Global_active_power, col='red', main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency") 

dev.off()
