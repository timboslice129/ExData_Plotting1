## reading data into R object "power" 
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

#Subsetting the dates we want
power2 <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

library(dplyr)

##combining date and time into one column to convert to POSIxt format
power2 <- mutate(power2, datetime = paste(Date, Time))

##Converting our datetime string into POSIlt format 
strptime(power2$datetime, format = "%e/%m/%Y %H:%M:%S")

#Plotting our graph
with(power2, plot(datetime, Global_active_power, type = "lines", ylab="Global Active Power(Kilowatts)", xlab = ""))

## writing to file
dev.copy(png, file = "plot2.png")

##closing PNG device
dev.off()

