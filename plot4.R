# Pulls desired dates from table
data <- read.csv('../../household_power_consumption.txt',sep=';',header=TRUE,
                 skip = grep('1/2/2007',readLines('../../household_power_consumption.txt'))
                 [1]-2, nrows=length(grep('^[1|2]/2/2007',readLines('../../household_power_consumption.txt'))),
                 na.strings = '?')
colnames(data) <- colnames(read.csv('../../household_power_consumption.txt',sep=';',nrows=1))

data$DateTime <- strptime(as.character(paste(data$Date,data$Time,sep=' ')),format='%d/%m/%Y %H:%M:%S')

#Plotting 4 different graphs
png(filename ='plot4.png')
par(mfrow=c(2,2))
Sys.setlocale('LC_ALL','English')
plot(data$DateTime, data$Global_active_power,type='l', xlab='',ylab='Global Active Power (kilowatts)')
plot(data$DateTime, data$Voltage,type='l', xlab='',ylab='Voltage')
plot(data$DateTime,data$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(data$DateTime,data$Sub_metering_2,col='red')
lines(data$DateTime,data$Sub_metering_3,col='blue')
legend('topright', legend=c('Sub metering 1','Sub metering 2','Sub metering 3'),col=c('black','red','blue'),lty=c(1,1,1))
plot(data$DateTime, data$Global_reactive_power,type='l', xlab='',ylab='Global Reactive Power (kilowatts)')
dev.off()