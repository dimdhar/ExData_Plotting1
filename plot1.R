## Get all into a dataset
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the data to the dates from 2007-02-01 to 2007-02-02
data2007 <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting dates to deisred format
datetime <- paste(as.Date(data2007$Date), data2007$Time)
data2007$Datetime <- as.POSIXct(datetime)

## Plot histogram
hist(data2007$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file to plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()