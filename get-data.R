# Downloads the required data. Run this script before any of the exploratory 
# analyses.
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
lclZip <- "exdata-data-NEI_data.zip"
if(!file.exists(lclZip)) {
  download.file(dataUrl, lclZip, method = "curl")
}
unzip(lclZip)
