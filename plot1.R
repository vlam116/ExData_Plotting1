## Plot 1 - remember to set your WD!

epc = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
epc_feb = subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
epc_feb$Global_active_power = as.numeric(as.character(epc_feb$Global_active_power))
hist(epc_feb$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red", 
     main = "Global Active Power")

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()