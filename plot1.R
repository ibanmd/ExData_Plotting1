## Data can be found at this link, was originally accessed on August 10, 2014
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## File was then unzipped on the desktop

## Read data into R
data <- read.table("/Users/Mario/Desktop/household_power_consumption.txt",sep=";",header=TRUE)

## Give the columns their appropriate names
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Create new column, DateTime, with formatted date and time
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %T")

## Subset the dates we want (this could have been done sooner to save time)
data2 <- subset(data, (as.Date(data$DateTime)=="2007-02-01" | as.Date(data$DateTime)=="2007-02-02"))

## Correct some data types (for some reason, just using as.numeric led to some errors)
## We will not be using columns 1 and 2 ("Date" and "Time") again so those can be left alone
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))
data2$Voltage <- as.numeric(as.character(data2$Voltage))
data2$Global_intensity <- as.numeric(as.character(data2$Global_intensity))
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

### --------------------------------------------------------------------------###
### Now we make the FIRST plot and save it
### --------------------------------------------------------------------------###

png("/Users/Mario/ExData_Plotting1/plot1.png", width=480, height=480)

hist(data2$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main="Global Active Power", 
     col="red")

dev.off()




