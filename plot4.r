## reading data into R object "power" 
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

#Subsetting the dates we want
power2 <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

library(dplyr)

##combining date and time into one column to convert to POSIXlt format
power2 <- mutate(power2, datetime = paste(Date, Time))

##Converting our datetime string into POSIXlt format 
strptime(power2$datetime, format = "%e/%m/%Y %H:%M:%S")

##setting parameters mfrow to plot 4 graphs
par(mfrow =c(2,2))

##plotting our graphs
with(power2, plot(datetime, Global_active_power, type = "lines", ylab="Global Active Power(Kilowatts)", xlab = ""))

with(power2, plot(datetime, Voltage, type = "lines", ylab = "Voltage"))

## initiating our plot
with(power2, plot(datetime, Sub_metering_1, type = "lines", xlab = "", ylab = "Energy sub metering"))

## adding our extra points
with(power2, points(datetime, Sub_metering_2, type = "lines", col = "red"))

with(power2, points(datetime, Sub_metering_3, type = "lines", col = "blue"))

##making our legend
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"))

with(power2, plot(datetime, Global_reactive_power, type = "lines"))

## writing to file
dev.copy(png, file = "plot4.png")

##closing PNG device
dev.off()

