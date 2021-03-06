masterpower<-read.table(file="household_power_consumption.txt",header=T,sep=";",na.strings="?")
DateTime<-paste(as.character(masterpower$Date),as.character(masterpower$Time)," ")
masterpower$Date<-strptime(DateTime,format="%d/%m/%Y %H:%M:%S",tz="PST8PDT")
DateTime<-NULL
begin<-strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S",tz="PST8PDT")
end<-strptime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S",tz="PST8PDT")
masterpower<-masterpower[masterpower$Date>begin & masterpower$Date<end & !is.na(masterpower$Date),]

#plot4
png(filename="plot4.png")
par(mfrow=c(2,2))
#subplota
Global_active_power<-masterpower[,3]
plot(masterpower$Date,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#subplotb
date<-masterpower$Date
plot(date,masterpower$Voltage,type="l",ylab="Voltage")
#subplotc
Sub_metering_1<-masterpower[,7]
Sub_metering_2<-masterpower[,8]
Sub_metering_3<-masterpower[,9]
plot(x=date,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(date,Sub_metering_2,type="l",col="red")
lines(date,Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
#subplotd
plot(date,masterpower$Global_reactive_power, type="l",ylab="Global reactive power",lwd=0.1)
points(data.frame(date,masterpower$Global_reactive_power),pch=20,cex=0.5)
dev.off()

