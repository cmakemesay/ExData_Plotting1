# Pulls desired dates from table
data <- read.csv('../../household_power_consumption.txt',sep=';',header=TRUE,
                  skip = grep('1/2/2007',readLines('../../household_power_consumption.txt'))
                  [1]-2, nrows=length(grep('^[1|2]/2/2007',readLines('../../household_power_consumption.txt'))),
                  na.strings = '?')
colnames(data) <- colnames(read.csv('../../household_power_consumption.txt',sep=';',nrows=1))

#Plot a histogram of Global Active Power                          
png(filename ='plot1.png')
hist(data$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()