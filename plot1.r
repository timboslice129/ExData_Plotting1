
## reading data into R object "power" 
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

#Subsetting the dates we want
power2 <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

#Creating histogram
with(power2, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

## writing to file
dev.copy(png, file = "plot1.png")

##closing PNG device
dev.off()


                    
  
                    
                    