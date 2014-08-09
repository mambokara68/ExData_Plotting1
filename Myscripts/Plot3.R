data <- read.table("household_power_consumption.txt", sep=";", na.strings="?",header=FALSE, skip= 66637, nrow=2880)
colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering1","Sub_metering2","Sub_metering3")

data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,"%d/%m/%Y  %H:%M:%S")




png(filename = "Plot3.png",width = 480, height = 480)
par(mfrow=c(1,1))
plot(data$datetime,data$Sub_metering1,type="l",xlab="",ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering2,type="l",xlab="",ylab="Energy sub metering",col="red")
lines(data$datetime,data$Sub_metering3,type="l",xlab="",ylab="Energy sub metering",col="blue")
legend("topright", lty=1, col = c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

