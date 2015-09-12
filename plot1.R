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

# create the png file containing the plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power, main= "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red" )
dev.off()