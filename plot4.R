# read the file
df <- read.csv("household_power_consumption.txt", sep = ";", na.strings='?')
df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]
# set the LC_TIME to english
Sys.setlocale("LC_TIME", "C")
# merge the Date and Time columns into single column, reorder the columns
df$Date_Time <- paste(df$Date,df$Time)
df$Date_Time <- strptime(df$Date_Time, "%d/%m/%Y %H:%M:%S")
df$Date <- NULL
df$Time <- NULL
df <- df[,c(8,1:7)]

# create the png file containing the plot4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
# 1st plot
with(df, plot(Date_Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power" ))
# 2nd plot
with(df, plot(Date_Time,Voltage, type = "l", xlab = "datetime", ylab = "Voltage" ))
# 3th plot
plot(df$Date_Time,df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$Date_Time,df$Sub_metering_2, col= "red" )
lines(df$Date_Time,df$Sub_metering_3, col= "blue" )
legend('topright',bty="n", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"),lty="solid")
# 4th plot
with(df, plot(Date_Time,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" ))

dev.off()