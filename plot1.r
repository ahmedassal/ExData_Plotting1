EPC = read.table("../data/household_power_consumption.txt", sep=";", header = TRUE, na.strings=c("?"))

EPC$Time = strptime(paste(EPC$Date, EPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
EPC$Date = as.Date(EPC$Date, format="%d/%m/%Y")

startDate=as.Date('01/02/2007',format='%d/%m/%Y')
endDate=as.Date('02/02/2007',format='%d/%m/%Y')
EPC.subset = subset(EPC, Date==startDate | Date==endDate)

png("plot1.png")
par(mar=c(5.1, 4, 4, 2), mfrow=c(1,1))
hist(EPC.subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", xlim=c(0, 6), ylim=c(0,1200), xaxt="n")
axis(1, at=c(0, 2, 4, 6), las=2 )
dev.off()