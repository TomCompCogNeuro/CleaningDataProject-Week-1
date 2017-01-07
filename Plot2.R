# plot 2
SelectedElectData <- read.csv("ElectData.csv")

# get the first time for the days
png(filename="Plot2.png",width = 480, height = 480)

NewDays <- grep('00:00:00',SelectedElectData$Time)
# add the saturday endpoint
NewDays <- c(NewDays,length(SelectedElectData$Global_active_power)+1)
NewDayLabels <- c("Thu","Fri","Sat")

# make the plot
plot(SelectedElectData$Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1, at=NewDays, labels=NewDayLabels)
dev.off()