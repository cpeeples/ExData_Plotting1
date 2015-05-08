masterpower<-read.table(file="household_power_consumption.txt",header=T,sep=";",na.strings="?")
DateTime<-paste(as.character(masterpower$Date),as.character(masterpower$Time)," ")
masterpower$Date<-strptime(DateTime,format="%d/%m/%Y %H:%M:%S",tz="PST8PDT")
DateTime<-NULL
begin<-strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S",tz="PST8PDT")
end<-strptime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S",tz="PST8PDT")
masterpower<-masterpower[masterpower$Date>begin & masterpower$Date<end & !is.na(masterpower$Date),]

#plot3
png(filename="plot3.png")
date<-masterpower$Date
Sub_metering_1<-masterpower[,7]
Sub_metering_2<-masterpower[,8]
Sub_metering_3<-masterpower[,9]
plot(x=date,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(date,Sub_metering_2,type="l",col="red")
lines(date,Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()