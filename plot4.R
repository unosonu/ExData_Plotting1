
##Reading the data
datafile <- "./household_power_consumption.txt"
data<-read.table(datafile,sep=";",header=T,na.string="?")

##Narrowing down to the specified dates
data2 <- data[(data$Date=="1/2/2007") | (data$Date == "2/2/2007"),]

##Creating specific combined datetime row 
x <- paste(as.Date(data2[,c("Date")], format = "%d/%m/%Y"), data2[,c("Time")])
data2$Datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")

##Creating png device and plotting
png(file="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(data2$Datetime, data2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(data2$Datetime, data2$Voltage, type="l", ylab="Voltage", xlab= "datetime")

plot(data2$Datetime,data2$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
points(data2$Datetime,data2$Sub_metering_2,type="l",col="red")
points(data2$Datetime,data2$Sub_metering_3,col="blue",type="l")
legend("topright",lty=1, col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, horiz=FALSE)

plot(data2$Datetime, data2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power",ylim=c(0,0.5))
dev.off()