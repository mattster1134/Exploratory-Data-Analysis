## Reading in house_power_consumption data set
power <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                  stringsAsFactors=FALSE)

## Converting Date to correct format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subsetting data to only get data from the dates 2007-02-01 and 2007-02-02
powersubset <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(powersubset$Date), powersubset$Time)
powersubset$Datetime <- as.POSIXct(datetime)

## Plotting data
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Exporting image as png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()