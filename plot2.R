library(data.table)

#download file
dt <- fread("household_power_consumption.txt", na.strings="?")

#Convert Date using as.Date, and only take 2007-02-01 and 2007-02-02
dt$Date<-as.Date(dt$Date,format="%d/%m/%Y")
dt2<-dt[(dt$Date=="2007-02-01"|dt$Date=="2007-02-02"),]
rm(dt)

#Combine Date and time so that we can plot points
dt2$DateTime<- as.POSIXct(paste(dt2$Date, dt2$Time))

#Plot a line graph of Global Active Power vs time
with(dt2,plot(DateTime,Global_active_power,xlab="",ylab="Global Active Power (Kilowats)",
               type="l"))

#Write histogram to png with Width and Height = 480
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()