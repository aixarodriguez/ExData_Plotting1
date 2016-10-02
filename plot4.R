download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","powerconsuption.zip")
data_pc<-read.table(unz("powerconsuption.zip","household_power_consumption.txt"),header=TRUE,sep=";")
head(data_pc)
data_pc$Date2<-as.Date(data_pc$Date,"%d/%m/%Y")
data_pc_02<-subset(data_pc,data_pc$Date2>='2007-02-01' & data_pc$Date2<='2007-02-02')
data_pc_02$Global_active_power<-as.numeric(as.character(data_pc_02$Global_active_power))
data_pc_02$Global_reactive_power<-as.numeric(as.character(data_pc_02$Global_reactive_power))
data_pc_02$Sub_metering_1<-as.numeric(as.character(data_pc_02$Sub_metering_1))
data_pc_02$Sub_metering_2<-as.numeric(as.character(data_pc_02$Sub_metering_2))
data_pc_02$Sub_metering_3<-as.numeric(as.character(data_pc_02$Sub_metering_3))
data_pc_02$Voltage<-as.numeric(as.character(data_pc_02$Voltage))
x<-as.numeric(nrow(data_pc_02))

par(mfrow = c(2,2), mar=c(1, 4, 1, 1) + 0.1)

plot(data_pc_02$Global_active_power,type="l",xlab="",xaxt="n",ylab="Global Active Power(kilowatts)")
axis(1,at=c(0,x/2,x),labels=c("Thu","Fri","Sat"))

plot(data_pc_02$Voltage,type="l",xlab="datetime",xaxt="n",ylab="Voltage")
axis(1,at=c(0,x/2,x),labels=c("Thu","Fri","Sat"),xlab="datetime")

plot(data_pc_02$Sub_metering_1,type="l",xlab="",xaxt="n",ylab="Energy sub metering")
lines(data_pc_02$Sub_metering_2,type="l",col="red",xlab="",xaxt="n")
lines(data_pc_02$Sub_metering_3,type="l",col="blue",xlab="",xaxt="n")
axis(1,at=c(0,x/2,x),labels=c("Thu","Fri","Sat"))
legend('topright',lty=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex=1)

plot(data_pc_02$Global_reactive_power,type="l",xlab="",xaxt="n",ylab="Global_reactive_power")
axis(1,at=c(0,x/2,x),labels=c("Thu","Fri","Sat"))

dev.copy(png,filename="plot4.png")
dev.off()
