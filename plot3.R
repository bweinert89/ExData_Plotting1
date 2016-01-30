library(data.table)

#download file
dt <- fread("household_power_consumption.txt", na.strings="?")

#Convert Date using as.Date, and only take 2007-02-01 and 2007-02-02
dt$Date<-as.Date(dt$Date,format="%d/%m/%Y")
dt2<-dt[(dt$Date=="2007-02-01"|dt$Date=="2007-02-02"),]
rm(dt)

#Combine Date and time so that we can plot points
dt2$DateTime<- as.POSIXct(paste(dt2$Date, dt2$Time))

#Do not create window, just save ot png to avoid issues with setting width/height
#with the legend
png("plot3.png", width=480, height=480)

#Create empty plot
with(dt2,plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",
              type="n"))
#Add lines
lines(dt2$DateTime,dt2$Sub_metering_1,col="black")
lines(dt2$DateTime,dt2$Sub_metering_2,col="red")
lines(dt2$DateTime,dt2$Sub_metering_3,col="blue")

#Add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=1,lwd=2)

dev.off()