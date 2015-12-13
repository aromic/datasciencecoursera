#plot 3
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";")

data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data<-data[start:end,]

plot(data$DateTime, as.numeric(as.character(data$Sub_metering_1)),type='l', 
     ylab ="Energy sub metering", xlab="")
 lines(data$DateTime, as.numeric(as.character(data$Sub_metering_2)),type='l', col='red')
 lines(data$DateTime, data$Sub_metering_3,type='l', col="blue")
 legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    lty=c(1,1,1)
                    ,col=c("black","red","blue"))
dev.copy(png, file="plot3.png", width=480, height=480)		
dev.off()		
