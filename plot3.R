#### download dataset and unzip in working directory

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "../../power_consumption.zip")
unzip("power_consumption.zip")

## read in table ###
data<-read.table("household_power_consumption.txt", sep=";",header = T, stringsAsFactors = FALSE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")

### filter for 2 days in February 2007
data_2012 <- filter(data, Date == "1/2/2007" | Date=="2/2/2007" )

### convert Date column to date format.
date_time <- paste(data_2012$Date, data_2012$Time)
date_col <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

new_data <- mutate(data_2012, date_time=date_col)

## plot 3

png("plot3.png")
plot(new_data$date_time, new_data$Sub_metering_1,type="l", xlab="",ylab="Energy sub metering")
lines(new_data$date_time,new_data$Sub_metering_2, col="red")
lines(new_data$date_time, new_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
dev.off()
