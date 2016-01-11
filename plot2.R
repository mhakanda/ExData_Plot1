#reading text files
d = read.table("household_power_consumption.txt", sep=";",header = TRUE,na.strings = "?")
#Subsetting the data for Feb 1 and Feb 2, 2007
myde=subset(d,Date=="1/2/2007"|Date=="2/2/2007")
#Open png file and plot the histogram
png(filename = "plot2.png", width = 480, height = 480, units = "px")
d1<-as.character(myde$Date)
d2<-as.character(myde$Time)
ddd<-paste(d1, d2)
#Time in right format
ee<-strptime(ddd,"%d/%m/%Y %H:%M:%S")
plot(ee,myde$Global_active_power,type="l", xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()
