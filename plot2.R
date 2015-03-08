
##Reading the data
datafile <- "./household_power_consumption.txt"
data<-read.table(datafile,sep=";",header=T,na.string="?")

##Narrowing down to the specified dates
data2 <- data[(data$Date=="1/2/2007") | (data$Date == "2/2/2007"),]

##Creating specific combined datetime row 
x <- paste(as.Date(data2[,c("Date")], format = "%d/%m/%Y"), data2[,c("Time")])
data2$Datetime <- strptime(x, "%Y-%m-%d %H:%M:%S")

##Creating png device and plotting
png(file="plot2.png", width=480, height=480, units="px")
plot(data2$Datetime,data2$Global_active_power, type='l', xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()