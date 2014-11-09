hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpcSmall <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]
hpcSmall$Time <- strptime(paste(hpcSmall$Date,hpcSmall$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
hpcSmall$Date <- as.Date(hpcSmall$Date, "%d/%m/%Y")
hpcSmall$Sub_metering_1 <- as.numeric(hpcSmall$Sub_metering_1)
hpcSmall$Sub_metering_2 <- as.numeric(hpcSmall$Sub_metering_2)
hpcSmall$Sub_metering_3 <- as.numeric(hpcSmall$Sub_metering_3)

png(filename="plot3.png",width=480,height=480, units="px")

with(hpcSmall,{
    ymax <- with(hpcSmall, max(Sub_metering_1,Sub_metering_2,Sub_metering_3))
    plot(Time,Sub_metering_1,type="n", ylim=c(0,ymax), xlab="",ylab="Energy sub metering")
    lines(Time,Sub_metering_1,col="black")
    lines(Time,Sub_metering_2,col="red")
    lines(Time,Sub_metering_3,col="blue")
    legend("topright", lty = 1, cex=0.75, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()