hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpcSmall <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]
hpcSmall$Time <- strptime(paste(hpcSmall$Date,hpcSmall$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
hpcSmall$Date <- as.Date(hpcSmall$Date, "%d/%m/%Y")
hpcSmall$Sub_metering_1 <- as.numeric(hpcSmall$Sub_metering_1)
hpcSmall$Sub_metering_2 <- as.numeric(hpcSmall$Sub_metering_2)
hpcSmall$Sub_metering_3 <- as.numeric(hpcSmall$Sub_metering_3)
hpcSmall$Global_active_power <- as.numeric(hpcSmall$Global_active_power)
hpcSmall$Global_reactive_power <- as.numeric(hpcSmall$Global_reactive_power)
hpcSmall$Voltage <- as.numeric(hpcSmall$Voltage)


png(filename="plot4.png",width=480,height=480, units="px")
par(mfcol = c(2, 2))

with(hpcSmall,{
    
    plot(Time,Global_active_power/1000,type="n", xlab="",ylab="Global Active Power (kilowatts)")
    lines(Time,Global_active_power/1000)
    
    ymax <- with(hpcSmall, max(Sub_metering_1,Sub_metering_2,Sub_metering_3))
    plot(Time,Sub_metering_1,type="n", ylim=c(0,ymax), xlab="",ylab="Energy sub metering")
    lines(Time,Sub_metering_1,col="black")
    lines(Time,Sub_metering_2,col="red")
    lines(Time,Sub_metering_3,col="blue")
    legend("topright", lty = 1, cex=0.75, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Time,Voltage,type="n",xlab="datetime")
    lines(Time,Voltage)

    plot(Time,Global_reactive_power,type="n",xlab="datetime")
    lines(Time,Global_reactive_power)
    
})
dev.off()