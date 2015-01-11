hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpcSmall <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]
hpcSmall$Date <- as.Date(hpcSmall$Date, "%d/%m/%Y")
hpcSmall$Global_active_power <- as.numeric(as.character(hpcSmall$Global_active_power))
png(filename="plot1.png",width=480,height=480, units="px")
hist(hpcSmall$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()