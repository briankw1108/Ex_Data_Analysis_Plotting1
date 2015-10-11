#Load libraries
library(lubridate); library(dplyr)

#Set up correct working directory
setwd("C://Users/u213493/Desktop/Data Science/Exploratory Data Analysis")

#unzip the file
#unzip("exdata_data_household_power_consumption.zip")

#Load the file
data = read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

#Convert Data variable from charactor to Date
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

#Subset the data between 2007-02-01 and 2007-02-02
newData = filter(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Create a new variable with Date/Time
DateTimeCombine = paste(newData$Date, newData$Time)
DateTime = strptime(DateTimeCombine, format = "%Y-%m-%d %H:%M:%S")
newData$Date_Time = DateTime

##Or the action above can be done as following
#DateTime = paste(newData$Date, newData$Time)
#newData$Date_Time = as.POSIXct(DateTime)

#Plot histogram of Global_active_power as plot1
par(mar = c(5.1, 4.1, 4.1, 2.1)) #Setup margins

#Save the histogram as png file named "plot1.png"
#attach(newData)
#png(filename = "plot2.png", height = 480, width = 480)
#with(newData, )
#dev.off()
#detach(newData)

##Or to save the plot, the action above can also be done as following
attach(newData)

par(mfrow = c(2, 2))

plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "Black")
points(Date_Time, Sub_metering_2, type = "l", col = "Red")
points(Date_Time, Sub_metering_3, type = "l", col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"), lty = 1, lwd = 1, bty = "n")

plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
detach(newData)
dev.off()