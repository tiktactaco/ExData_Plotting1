## Script for Exploratory Data Analysis Class Project 1
## Creates plot4.png

library(tidyverse)
library(lubridate)

temp <- tempfile()
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, temp)
epcdata <- read_delim(temp, delim=';', na=c("", "?"))
unlink(temp)

epcdata$Date <- dmy(epcdata$Date)
epcdata <- subset(epcdata, Date=="2007-02-01" | Date=="2007-02-02")

png(filename = "plot4.png", width = 480, height = 480)

epcdata$fulldate <- with(epcdata, ymd(Date) + hms(Time))

#Setup four plots
par(mfcol=c(2,2))

#First plot
plot(epcdata$Global_active_power~epcdata$fulldate, type="l", 
     ylab="Global Active Power", xlab='')

#Second plot
plot(epcdata$Sub_metering_1~epcdata$fulldate, type="l", 
     ylab="Energy Sub Metering", xlab='', col='black')
lines(epcdata$Sub_metering_2~epcdata$fulldate, type="l", col = 'red')
lines(epcdata$Sub_metering_3~epcdata$fulldate, type='l', col = 'blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2',
                            'Sub_metering_3'), col=c("black", "red", "blue"), lty=1)

#Third plot
plot(epcdata$Voltage~epcdata$fulldate, type="l", 
     ylab="Voltage", xlab='datetime')

#Fourth plot
plot(epcdata$Global_reactive_power~epcdata$fulldate, type="l", 
     ylab="Global_reactive_power", xlab='datetime')

dev.off()