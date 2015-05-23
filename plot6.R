# Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in motor 
# vehicle emissions?
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Identify and subset the SCCs relating to vehicles for filtering
vehicle_sector <- grepl("Vehicle", SCC$EI.Sector)
vehicle_SCC <- SCC$SCC[vehicle_sector]
vehicle_SCC <- as.character(vehicle_SCC)
# Aggregate the data using dplyr functions
la_baltimore_vehicle_emissions_by_year <- NEI %>%
  filter(fips == "24510" | fips == "06037", SCC %in% vehicle_SCC) %>%
  group_by(fips, year) %>%
  summarise(emissions = sum(Emissions))
# Plot the data
png("plot6.png")
plot6 <- ggplot(la_baltimore_vehicle_emissions_by_year, aes(year, emissions, colour = fips)) +
  geom_point() +
  geom_line() +
  xlab("Year") +
  ylab("PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions From Motor Vehicles by City") +
  scale_colour_discrete(name = "City",
                        labels = c("Los Angeles County", "Baltimore City"))
print(plot6)
dev.off()
