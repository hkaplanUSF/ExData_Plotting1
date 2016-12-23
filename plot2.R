## Plot 2 -- Line Graph
#read in the dataset
epcDataAll = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
#Subset the data need - by date specified for the graph
epcData = epcDataAll[epcDataAll$Date %in% c("1/2/2007","2/2/2007") ,]

# convert data time format
date = strptime(paste(epcData$Date, epcData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap = as.numeric(epcData$Global_active_power)

# Open png device
png(file="plot2.png", width = 480, height = 480)

#Generrate Plot
plot(date, gap, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

#Close the graphics/png device
dev.off()
###############################
