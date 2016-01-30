library(data.table)

#download file
dt <- fread("household_power_consumption.txt", na.strings="?")

#Convert Date using as.Date, and only take 2007-02-01 and 2007-02-02
dt$Date<-as.Date(dt$Date,format="%d/%m/%Y")
dt2<-dt[(dt$Date=="2007-02-01"|dt$Date=="2007-02-02"),]
rm(dt)

#Create Histogram of Global Active Power in Kilowats
hist(dt2$Global_active_power,xlab="Global Active Power (Kilowats)",main="Global Active Power",
      col="red")

#Write histogram to png with Width and Height = 480
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()