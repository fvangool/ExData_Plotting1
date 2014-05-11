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

# Plot the Global active power over the defined period
png("plot2.png", 400 ,400)
plot(data$datetime, data$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab="")
dev.off()


