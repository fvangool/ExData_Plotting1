# Read the data file;
# set "NA" values for "?" entries;
# set "." as decimal point; 
# set class types for columns;
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",
                 dec=".", colClasses=c(rep("character",2),rep("numeric",7))) 
# Convert "Date" column to Date format 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Subset the dataset corresponding to the specified dates
data<- subset(data, data$Date %in% c(as.Date("2007-02-01"), 
                                     as.Date("2007-02-02")))
#create seperate date time column
datetime <- paste(data$Date,data$Time)
data$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")


png("plot4.png", 400,400)
# Create 4 plots 2 by 2
par(mfrow=c(2,2))
# Plot the histogram for the variable Global_active_power 
plot(data$datetime, data$Global_active_power,type="l", ylab="Global Active Power", xlab="")
# Plot the Voltage data over the defined period
plot(data$datetime, data$Voltage,type="l", ylab="Voltage", xlab="datetime")
# Plot the sub metering data over the defined period, each type in a different
# color.
plot(data$datetime, data$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(data$datetime, data$Sub_metering_2,type="l", col="red")
lines(data$datetime, data$Sub_metering_3,type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1),col=c("black","red","blue"), bty='n', cex=.60)
# Plot the Global reactive power data over the defined period.
plot(data$datetime, data$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off() 