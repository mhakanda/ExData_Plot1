#reading text files
#I have unzipped the file and saved the text file locally
d = read.table("household_power_consumption.txt", sep=";",header = TRUE,na.strings = "?")
#Subsetting the data for Feb 1 and Feb 2, 2007
myde=subset(d,Date=="1/2/2007"|Date=="2/2/2007")
#Open png file and plot the histogram
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(myde$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="red")
dev.off()

