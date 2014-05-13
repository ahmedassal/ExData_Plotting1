EPC = read.table("../data/household_power_consumption.txt", sep=";", header = TRUE, na.strings=c("?"))

EPC$Time = strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
EPC$Date = as.Date(EPC$Date, format="%d/%m/%Y")

startDate=as.Date('01/02/2007',format='%d/%m/%Y')
endDate=as.Date('02/02/2007',format='%d/%m/%Y')
EPC.subset = subset(EPC, Date==startDate | Date==endDate)

png("plot2.png")
par(mar=c(5.1, 4, 4, 2), mfrow=c(1,1))
plot(EPC.subset$Time, EPC.subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()