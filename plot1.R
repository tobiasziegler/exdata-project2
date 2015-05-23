# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
# Aggregate the data using dplyr functions
emissions_by_year <- NEI %>%
  group_by(year) %>%
  summarise(emissions = sum(Emissions))
# Plot the data
png("plot1.png")
plot(
  emissions_by_year$year,
  emissions_by_year$emissions,
  type = "o",
  xlab = "Year",
  ylab = "PM2.5 Emissions",
  main = "Total PM2.5 Emissions From All Sources, United States",
  ylim = c(0, 8e6)
)
dev.off()
