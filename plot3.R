##   Plot 3
#read in the dataset
epcDataAll = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
#head(epcDataAll);names(epcDataAll)
#Subset the data need - by date specified for the graph
epcData = epcDataAll[epcDataAll$Date %in% c("1/2/2007","2/2/2007") ,]

# Open png device
png(file="plot3.png", width = 480, height = 480)

# convert data time format
date = strptime(paste(epcData$Date, epcData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
SubMeter1 = epcData$Sub_metering_1
SubMeter2 = epcData$Sub_metering_2
SubMeter3 = epcData$Sub_metering_3

plot(date, SubMeter1, type = "l", xlab="", ylab="Energy sub metering")
lines(date, SubMeter2, col = "red", type = "l")
lines(date, SubMeter3, col = "blue", type = "l")
legend("topright", 1.9, c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lty = 1, 
       col = c("black","red","blue"), merge = F, x.intersp=1, cex = .8)

#Close the graphics/png device
dev.off()
##################