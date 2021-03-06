install.packages("dplyr")
install.packages("RColorBrewer")
install.packages("ggplot2")
library(dplyr)
library(RColorBrewer)
library(ggplot2)


if(!file.exists("E:/R/Exploratory Data Analysis/Assignment")){dir.create("E:/R/Exploratory Data Analysis/Assignment")}
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, "E:/R/Exploratory Data Analysis/Assignment/Data_for_Peer Assessment.zip",method="auto") 
unzip ("E:/R/Exploratory Data Analysis/Assignment/Data_for_Peer Assessment.zip", exdir = "E:/R/Exploratory Data Analysis/Assignment")


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)
str(NEI)
dim(NEI)

years <- group_by(NEI, year)
str(years)
data<-summarize(years, Emissions = sum(Emissions, na.rm = TRUE))
data

plot1<-barplot(height=data$Emissions/1000,names.arg=data$year,col=rainbow(4),ylim=c(0,8000))
title(main = "Total PM2.5 emission (kilotons) per Year",xlab="Years", ylab="Total PM2.5 emission (kilotons)")
text(x = plot1, y = round(data$Emissions/1000,3), label = round(data$Emissions/1000,3), pos = 3, cex = 0.8, col = "black")

dev.copy(png, file="plot1.png")
dev.off()
