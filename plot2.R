# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
# Aggregate the data using dplyr functions
baltimore_emissions_by_year <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(emissions = sum(Emissions))
# Plot the data
png("plot2.png")
plot(
  baltimore_emissions_by_year$year,
  baltimore_emissions_by_year$emissions,
  type = "o",
  xlab = "Year",
  ylab = "PM2.5 Emissions",
  main = "Total PM2.5 Emissions From All Sources, Baltimore City, Maryland",
  ylim = c(0, 3400)
)
dev.off()
