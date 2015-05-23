# Question 4:
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Identify and subset the SCCs relating to coal combustion for filtering
coal_sector <- grepl("Coal", SCC$EI.Sector)
coal_SCC <- SCC$SCC[coal_sector]
coal_SCC <- as.character(coal_SCC)
# Aggregate the data using dplyr functions
coal_emissions_by_year <- NEI %>%
  filter(SCC %in% coal_SCC) %>%
  group_by(year) %>%
  summarise(emissions = sum(Emissions))
# Plot the data
png("plot4.png")
plot4 <- ggplot(coal_emissions_by_year, aes(year, emissions)) +
  geom_point() +
  geom_line() +
  xlab("Year") +
  ylab("PM2.5 Emissions") +
  ggtitle("Total PM2.5 Emissions From Coal Combustion, United States") +
  ylim(0, 600000)
print(plot4)
dev.off()
