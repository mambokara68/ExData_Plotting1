data <- read.table("household_power_consumption.txt", sep=";", na.strings="?",header=FALSE, skip= 66637, nrow=2880)
colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering1","Sub_metering2","Sub_metering3")

data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,"%d/%m/%Y  %H:%M:%S")


png(filename = "Plot2.png",width = 480, height = 480)
plot(data$datetime,data[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

