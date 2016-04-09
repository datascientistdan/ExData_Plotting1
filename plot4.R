#Retrieve the data from the website provided
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
courseraData <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep=";", na.strings = "?")
unlink(temp)

# subset data to two days required for graphing
courseraData <- courseraData[(courseraData$Date=="1/2/2007" | courseraData$Date =="2/2/2007"),]

# Create a column that combines the date and time as a Date class
courseraData$DateTime <- as.POSIXct(strptime(paste(courseraData$Date, courseraData$Time), 
                                             format="%d/%m/%Y %H:%M:%S"))



# Create histogram of the Global active power from 2/1/2007 to 2/2/2007
hist(courseraData$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Create a 2x2 layout for the graphs
par(mfrow=c(2,2))


# Create the first plot
plot(courseraData$DateTime, courseraData$Global_active_power, type="l", ylab="Global Active Power")

# Create the second plot
plot(courseraData$DateTime, courseraData$Voltage, type="l", ylab="Voltage", xlab="datetime")


# Create the third plot
plot(courseraData$DateTime, courseraData$Sub_metering_1, type="l", ylab="Energy sub meeting", xlab="")
lines(courseraData$DateTime, courseraData$Sub_metering_2, type="l", col="red")
lines(courseraData$DateTime, courseraData$Sub_metering_3, type="l", col="blue")
legend("topright", title="", cex=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

# Create the fourth plot
plot(courseraData$DateTime, courseraData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")



# Save the file as a .png 
png('plot4.png', width=480, height=480)

# Create a 2x2 layout for the graphs
par(mfrow=c(2,2))

# Create the first plot
plot(courseraData$DateTime, courseraData$Global_active_power, type="l", ylab="Global Active Power")

# Create the second plot
plot(courseraData$DateTime, courseraData$Voltage, type="l", ylab="Voltage", xlab="datetime")


# Create the third plot
plot(courseraData$DateTime, courseraData$Sub_metering_1, type="l", ylab="Energy sub meeting", xlab="")
lines(courseraData$DateTime, courseraData$Sub_metering_2, type="l", col="red")
lines(courseraData$DateTime, courseraData$Sub_metering_3, type="l", col="blue")
legend("topright", title="", cex=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

# Create the fourth plot
plot(courseraData$DateTime, courseraData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()

# Return graph layout to 1x1
par(mfrow=c(1,1))

