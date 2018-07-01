#### download dataset and unzip in working directory

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "../../power_consumption.zip")
unzip("power_consumption.zip")
 
## read in table ###
data<-read.table("household_power_consumption.txt", sep=";",header = T, stringsAsFactors = FALSE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")

### filter for 2 days in February 2007
data_2012 <- filter(data, Date == "1/2/2007" | Date=="2/2/2007" )

## produce plot1
png("plot1.png")
hist(data_2012$Global_active_power,col = "red",main = "Global Active Power", xlab="Global Active Power (kilowatts")
dev.off()
