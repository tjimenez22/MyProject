# The .txt file must be in your working directory
data<-read.table("household_power_consumption.txt",header=T,sep=";")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
data$Time<-strftime(data$Time, '%H:%M:%S')

data$Global_active_power[data$Global_active_power == "?"] <- NA
DATE1 <- as.Date("2007-01-31")
DATE2 <- as.Date("2007-02-03")
df<-data[data$Date>DATE1&data$Date<DATE2,]
# plot(as.numeric(as.character(df$Sub_metering_1)), type="l",xaxt = "n", ylab="Energy sub metering",xlab="")
# lines(as.numeric(as.character(df$Sub_metering_2)), col="red")
# lines(as.numeric(as.character(df$Sub_metering_3)), col="blue")
# axis(1, at=c(0,1500,2900), lab=c("Thu","Fri","Sat"))
# legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"),lty=c(1,1,1))


png(file = "Plot3.png", bg = "white")
plot(as.numeric(as.character(df$Sub_metering_1)), type="l",xaxt = "n", ylab="Energy sub metering",xlab="")
lines(as.numeric(as.character(df$Sub_metering_2)), col="red")
lines(as.numeric(as.character(df$Sub_metering_3)), col="blue")
axis(1, at=c(0,1500,2900), lab=c("Thu","Fri","Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red", "blue"),lty=c(1,1,1))
dev.off()