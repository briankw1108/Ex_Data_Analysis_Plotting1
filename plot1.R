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
png(filename = "plot1.png", height = 480, width = 480)
with(newData, hist(newData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red"))
dev.off()

##Or to save the plot, the action above can also be done as following
#hist(newData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
#dev.copy(png, file = "plot1.png", height = 480, width = 480)
#dev.off()

