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

# Save the file as a .png 
png('plot1.png', width=480, height=480)
hist(courseraData$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()