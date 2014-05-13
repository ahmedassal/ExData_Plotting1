EPC = read.table("../data/household_power_consumption.txt", sep=";", header = TRUE, na.strings=c("?"))

EPC$Time = strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
EPC$Date = as.Date(EPC$Date, format="%d/%m/%Y")

startDate=as.Date('01/02/2007',format='%d/%m/%Y')
endDate=as.Date('02/02/2007',format='%d/%m/%Y')
EPC.subset = subset(EPC, Date==startDate | Date==endDate)

png("plot4.png")
par(mar=c(5.1, 4, 4, 2), mfrow=c(2,2))
#Plot 1
plot(EPC.subset$Time, EPC.subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Plot 2
plot(EPC.subset$Time, EPC.subset$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot 3
plot(EPC.subset$Time, EPC.subset$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(EPC.subset$Time, EPC.subset$Sub_metering_1, col="black")
lines(EPC.subset$Time, EPC.subset$Sub_metering_2, col="red")
lines(EPC.subset$Time, EPC.subset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=1, lty=c(1,1,1),  pch=c(NA,NA,NA), bty = "n")

#Plot 4
plot(EPC.subset$Time, EPC.subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", ylim = c(0,0.5), yaxt="n")
axis(2, at=c(0.0,0.1, 0.2,0.3, 0.4, 0.5), las=2 )
#axis(2, xaxp=c(0.0,0.1, 0.2,0.3, 0.4, 0.5), las=2)
dev.off()