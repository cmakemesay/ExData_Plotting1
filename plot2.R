# Pulls desired dates from table
data <- read.csv('../../household_power_consumption.txt',sep=';',header=TRUE,
                 skip = grep('1/2/2007',readLines('../../household_power_consumption.txt'))
                 [1]-2, nrows=length(grep('^[1|2]/2/2007',readLines('../../household_power_consumption.txt'))),
                 na.strings = '?')
colnames(data) <- colnames(read.csv('../../household_power_consumption.txt',sep=';',nrows=1))

data$DateTime <- strptime(as.character(paste(data$Date,data$Time,sep=' ')),format='%d/%m/%Y %H:%M:%S')

#Plotting Global Active Power against time
png(filename ='plot2.png')
Sys.setlocale('LC_ALL','English')
plot(data$DateTime, data$Global_active_power,type='l', xlab='',ylab='Global Active Power (kilowatts)')
dev.off()