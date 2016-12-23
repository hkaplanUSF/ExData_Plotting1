##   Plot 1  a histogram x-Global Active Power, Y - Frequency
#read in the dataset
epcDataAll = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
#head(epcDataAll);names(epcDataAll)
#Subset the data need - by date specified for the graph
epcData = epcDataAll[epcDataAll$Date %in% c("1/2/2007","2/2/2007") ,]
# Open png device
png(file="plot1.png", width = 480, height = 480)
#read data as numeric values
gap = as.numeric(epcData$Global_active_power)
#Plot the values, with added parameters
hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#Close the graphics/png device
dev.off()
###############################

