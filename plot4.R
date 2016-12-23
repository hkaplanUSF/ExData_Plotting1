##   Plot 4 -- Four Exploratory Graphs
#read in the dataset
epcDataAll = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
#head(epcDataAll);names(epcDataAll)
#Subset the data need - by date specified for the graph
epcData = epcDataAll[epcDataAll$Date %in% c("1/2/2007","2/2/2007") ,]

# convert data time format
date = strptime(paste(epcData$Date, epcData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap = as.numeric(epcData$Global_active_power)

# Open png device
png(file="plot4.png", width = 480, height = 480)

#Graph Layout - 2 rows 2 columns
par(mfrow=c(2,2))

#Generrate Plots
plot(date, gap, type = "l", xlab = "", ylab = "Global Active Power")
plot(date, epcData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

SubMeter1 = epcData$Sub_metering_1
SubMeter2 = epcData$Sub_metering_2
SubMeter3 = epcData$Sub_metering_3

plot(date, SubMeter1, type = "l", xlab="", ylab="Energy sub metering")
lines(date, SubMeter2, col = "red", type = "l")
lines(date, SubMeter3, col = "blue", type = "l")
legend("topright",inset = .02, c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),lwd = 2, lty=1, 
       col = c("black","red","blue"), bty = "n", cex=.6)

plot(date, epcData$Global_reactive_power, type = "l", xlab = "datetime", ylab= "Global_reactive_power")

#Close the graphics/png device
dev.off()
##################