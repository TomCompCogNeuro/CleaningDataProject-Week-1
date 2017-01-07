SelectedElectData <- read.csv("ElectData.csv")
png(filename="Plot4.png",width = 480, height = 480)

# set up the plots
par(mfrow=c(2,2))

# set up the labels
# get the first time for the days
NewDays <- grep('00:00:00',SelectedElectData$Time)
# add the saturday endpoint
NewDays <- c(NewDays,length(SelectedElectData$Global_active_power)+1)

NewDayLabels <- c("Thu","Fri","Sat")

# subplot 1
# make the plot
plot(SelectedElectData$Global_active_power,type="l", xlab="",ylab="Global Active Power",xaxt="n",pch = 1)
axis(1, at=NewDays, labels=NewDayLabels)

# subplot 2
# make the plot
plot(SelectedElectData$Voltage,type="l", xlab="datetime",ylab="Voltage",xaxt="n",pch = 2)
axis(1, at=NewDays, labels=NewDayLabels)


# subplot 3
# make the plot
plot(SelectedElectData$Sub_metering_1,col = 'black', type="l", xlab="",ylab="Energgy sub metering",xaxt="n",pch = 3)
axis(1, at=NewDays, labels=NewDayLabels)
lines(SelectedElectData$Sub_metering_2,type="l",col="red")
lines(SelectedElectData$Sub_metering_3,type="l",col="blue")

leg.txt <- c('Sub 1', "Sub 2", "Sub3")
leg.loc <- "topright"
leg.col <- c("black","red", "blue")

legend(leg.loc,leg.txt, col = leg.col, lty=1, cex=0.8)

# subplot 4
# make the plot
plot(SelectedElectData$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power",xaxt="n",pch = 4)
axis(1, at=NewDays, labels=NewDayLabels)
dev.off()
