
##Read the data, but only the needed one : from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?",header=FALSE, skip= 66637, nrow=2880)
##add column names
colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering1","Sub_metering2","Sub_metering3")

##Transform the date and time values from factor to character to real datetime class values
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,"%d/%m/%Y  %H:%M:%S")

##start the acquisition of the png file
png(filename = "Plot4.png",width = 480, height = 480)
## 4 graphs on the page, 2 rows 2columns
par(mfrow = c(2, 2))
##Plot the 4 needed graphs
##same as Plot1
plot(data$datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
##same as Plot2
plot(data$datetime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
##same as Plot3
plot(data$datetime,data$Sub_metering1,type="l",xlab="",ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering2,type="l",xlab="",ylab="Energy sub metering",col="red")
lines(data$datetime,data$Sub_metering3,type="l",xlab="",ylab="Energy sub metering",col="blue")
legend("topright",cex=.75, bty="n",lty=1, col = c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## the new one
plot(data$datetime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
## Close the acquisition
dev.off()

