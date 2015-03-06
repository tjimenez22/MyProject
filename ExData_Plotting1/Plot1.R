# The .txt file must be in your working directory
data<-read.table("household_power_consumption.txt",header=T,sep=";")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
data$Time<-strftime(data$Time, '%H:%M:%S')

data$Global_active_power[data$Global_active_power == "?"] <- NA
DATE1 <- as.Date("2007-01-31")
DATE2 <- as.Date("2007-02-03")
df<-data[data$Date>DATE1&data$Date<DATE2,]
# hist(as.numeric(as.character(df$Global_active_power)),col="red",main="Global active power")
png(file = "Plot1.png", bg = "white")
hist(as.numeric(as.character(df$Global_active_power)),col="red",main="Global active power",xlab="Global active power (kilowatts)")
dev.off()


