# Question 3:
# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in 
# emissions from 1999–2008 for Baltimore City? Which have seen increases in 
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
# answer this question.
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
# Aggregate the data using dplyr functions
baltimore_emissions_by_year_type <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(emissions = sum(Emissions))
# Plot the data
png("plot3.png")
plot3 <- ggplot(baltimore_emissions_by_year_type, aes(year, emissions, colour = type)) +
  geom_point() +
  geom_line() +
  xlab("Year") +
  ylab("PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions by Source Type, Baltimore City, Maryland")
print(plot3)
dev.off()
