

png(filename = "Plot2.png",width = 480, height = 480)

plot(data$datetime,data[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
## Close the acquisition
dev.off()


##Read the data, but only the needed one : from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?",header=FALSE, skip= 66637, nrow=2880)

##add column names
colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering1","Sub_metering2","Sub_metering3")

##Transform the date and time values from factor to character to real datetime class values
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,"%d/%m/%Y  %H:%M:%S")

##start the acquisition of the png file
png(filename = "Plot3.png",width = 480, height = 480)
## 1 graph on the page
par(mfrow=c(1,1))
## plot the needed graph
plot(data$datetime,data$Sub_metering1,type="l",xlab="",ylab="Energy sub metering")
##Add the different graph to the same graph
lines(data$datetime,data$Sub_metering2,type="l",xlab="",ylab="Energy sub metering",col="red")
lines(data$datetime,data$Sub_metering3,type="l",xlab="",ylab="Energy sub metering",col="blue")
##Add the needed legend
legend("topright", lty=1, col = c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Close the acquisition
dev.off()

