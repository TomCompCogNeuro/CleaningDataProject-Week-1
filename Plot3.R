# plot 3
SelectedElectData <- read.csv("ElectData.csv")

png(filename="Plot3.png",width = 480, height = 480)
# get the first time for the days
NewDays <- grep('00:00:00',SelectedElectData$Time)
# add the saturday endpoint
NewDays <- c(NewDays,length(SelectedElectData$Global_active_power)+1)
NewDayLabels <- c("Thu","Fri","Sat")

# make the plot
plot(SelectedElectData$Sub_metering_1,col = 'black', type="l", xlab="",ylab="Energy sub metering",xaxt="n")
axis(1, at=NewDays, labels=NewDayLabels)
lines(SelectedElectData$Sub_metering_2,type="l",col="red")
lines(SelectedElectData$Sub_metering_3,type="l",col="blue")

leg.txt <- c('Sub 1', "Sub 2", "Sub3")
leg.loc <- "topright"
leg.col <- c("black","red", "blue")

legend(leg.loc,leg.txt, col = leg.col, lty=1, cex=0.8)
dev.off()
