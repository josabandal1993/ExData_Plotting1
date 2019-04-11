library(data.table)
library(lubridate)
#Read the dataset
dat = fread("../exdata_data_household_power_consumption/household_power_consumption.txt",sep = ";")
x_date = dmy(dat$Date)
x_date = as.Date(x_date)

#Look for the entries that was made at 2007-02-01 and 2007-02-02
y = c(grep("*2007-02-01",x_date),grep("*2007-02-02",x_date))
sub1 = as.numeric(dat$Sub_metering_1[y])
sub2 = as.numeric(dat$Sub_metering_2[y])
sub3 = as.numeric(dat$Sub_metering_3[y])

x_time = ymd_hms(paste(x_date, dat$Time))[y]

#Plot the 3 energy submetering with respect to time
png("plot3.png", width = 480, height = 480)

plot(x_time,sub1, xlab = "", ylab = "Energy sub metering", type = "l")
points(x_time,sub2, type = "l", col = "red")
points(x_time,sub3, type = "l", col = "blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1:1,lwd=2)
dev.off()