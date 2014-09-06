## Reading in house_power_consumption data set
power <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                  stringsAsFactors=FALSE)

## Converting Date and Time to correct format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time =strptime(power$Time,format="%H:%M:%S")

## Subsetting data to only get data from the dates 2007-02-01 and 2007-02-02
powersubset <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Creating Histogram
hist(powersubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Exporting image as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()