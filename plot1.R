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

# Create the histogram for the variable Global_active_power and save the
# plot in a "png" file.
png("plot1.png", 500 ,600)
hist(data$Global_active_power, xlab="Global Active Power (killowatts)", 
     col="red", main="Global Active Power", )
dev.off()