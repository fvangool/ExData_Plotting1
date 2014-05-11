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

# Plot the sub metering data over the defined period
# For each sub metering type (1, 2 or 3) a different color will be used
# for the data.
png("plot3.png", 400 ,400)
plot(data$datetime, data$Sub_metering_1,type="l", ylab="Energy sub metering", 
     xlab="")
lines(data$datetime, data$Sub_metering_2,type="l", col="red")
lines(data$datetime, data$Sub_metering_3,type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1),col=c("black","red","blue"))
dev.off()      