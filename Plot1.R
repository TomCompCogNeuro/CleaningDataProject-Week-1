SelectedElectData <- read.csv("ElectData.csv")

# plot 1
png(filename="Plot1.png",width = 480, height = 480)
hist(SelectedElectData$Global_active_power, col = 'red',main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()