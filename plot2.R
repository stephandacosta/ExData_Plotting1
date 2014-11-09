hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpcSmall <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]
hpcSmall$Time <- strptime(paste(hpcSmall$Date,hpcSmall$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
hpcSmall$Date <- as.Date(hpcSmall$Date, "%d/%m/%Y")
hpcSmall$Global_active_power <- as.numeric(hpcSmall$Global_active_power)

png(filename="plot2.png",width=480,height=480, units="px")
with(hpcSmall,{
    plot(Time,Global_active_power/1000,type="n", xlab="",ylab="Global Active Power (kilowatts)")
    lines(Time,Global_active_power/1000)
})
dev.off()