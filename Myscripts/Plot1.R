
##Read the data, but only the needed one : from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", sep=";", header=FALSE,na.strings="?", skip= 66637, nrow=2880)

##add column names
colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global intensity","Sub metering1","Sub metering2","Sub metering3")

##start the acquisition of the png file
png(filename = "Plot1.png",width = 480, height = 480)
##1 graph on the page
par(mfrow=c(1,1))
## plot the needed histogramm
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
## Close the acquisition
dev.off()
