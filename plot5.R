# Question 5:
# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Identify and subset the SCCs relating to vehicles for filtering
vehicle_sector <- grepl("Vehicle", SCC$EI.Sector)
vehicle_SCC <- SCC$SCC[vehicle_sector]
vehicle_SCC <- as.character(vehicle_SCC)
# Aggregate the data using dplyr functions
baltimore_vehicle_emissions_by_year <- NEI %>%
  filter(fips == "24510", SCC %in% vehicle_SCC) %>%
  group_by(year) %>%
  summarise(emissions = sum(Emissions))
# Plot the data
png("plot5.png")
plot5 <- ggplot(baltimore_vehicle_emissions_by_year, aes(year, emissions)) +
  geom_point() +
  geom_line() +
  xlab("Year") +
  ylab("PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions From Motor Vehicles, Baltimore City, Maryland") +
  ylim(0, 350)
print(plot5)
dev.off()
