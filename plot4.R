#reading text files
d = read.table("household_power_consumption.txt", sep=";",header = TRUE,na.strings = "?")
#Subsetting the data for Feb 1 and Feb 2, 2007
myde=subset(d,Date=="1/2/2007"|Date=="2/2/2007")
#Open png file and plot the histogram
png(filename = "plot4.png", width = 480, height = 480, units = "px")
d1<-as.character(myde$Date)
d2<-as.character(myde$Time)
ddd<-paste(d1, d2)
#Time in right format
ee<-strptime(ddd,"%d/%m/%Y %H:%M:%S")
#Start plotting
par(mfrow=c(2,2))
plot(ee,myde$Global_active_power,type="l", xlab="",ylab = "Global Active Power")
plot(ee,myde$Voltage,type="l", xlab="datetime",ylab = "Voltage")
plot(ee,myde$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
lines(ee,myde$Sub_metering_2,type="l",xlab = "",ylab = "Energy sub metering",col="red")
lines(ee,myde$Sub_metering_3,type="l",xlab = "",ylab = "Energy sub metering",col="blue")
legend('topright',col=c('black', 'red', 'blue'),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty = "n",cex = .5)
plot(ee,myde$Global_reactive_power,type="l", xlab="datetime",ylab = "Global_reactive_power")
dev.off()