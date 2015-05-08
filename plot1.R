masterpower<-read.table(file="household_power_consumption.txt",header=T,sep=";",na.strings="?")
DateTime<-paste(as.character(masterpower$Date),as.character(masterpower$Time)," ")
masterpower$Date<-strptime(DateTime,format="%d/%m/%Y %H:%M:%S",tz="PST8PDT")
DateTime<-NULL
begin<-strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S",tz="PST8PDT")
end<-strptime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S",tz="PST8PDT")
masterpower<-masterpower[masterpower$Date>begin & masterpower$Date<end & !is.na(masterpower$Date),]

#plot1, looks like a histogram binned on global active power
names(masterpower)
Global_active_power<-masterpower[,3]
png(filename="plot1.png")
hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()



