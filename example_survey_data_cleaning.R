# survey_cleaning_2015

int <- read.csv("./R_in_ecology/example_survey_data.csv")

regions <- c("nw","nc","ne","se")

fs <- c("fed","stat")

print(paste0(int[(int$region %in% regions==FALSE),]$region," "," region"))
print(paste0(int[(int$fs %in% fs==FALSE),]$area," "," area"))
is.numeric(int$sora)
is.numeric(int$jdate)
