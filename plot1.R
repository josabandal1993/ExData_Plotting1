library(data.table)
library(lubridate)
#Read the dataset
dat = fread("../exdata_data_household_power_consumption/household_power_consumption.txt",sep = ";")
x_date = dmy(dat$Date)
x_date = as.Date(x_date)
#Look for the entries that was made at 2007-02-01 and 2007-02-02
y = c(grep("*2007-02-01",x_date),grep("*2007-02-02",x_date))
active = as.numeric(dat$Global_active_power[y])

#Plot the Global active power
png("plot1.png", width = 480, height = 480)
hist(active, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
