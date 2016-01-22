
file_names <- list.files(path="./R_in_ecology/night_files/",pattern=".csv")

# these are highly subseted files from my dissertation, I realize that latitude typically has longitude with it, but, this is all I'm using for this example.  

library(tidyr)
library(dplyr)
library(auriel)

nights <- list()


for(i in 1:length(file_names)){
  dat <- as.data.frame(file_names[i]) 
  colnames(dat) <- "name"
  names <- dat %>% separate(name, into=c("year","month","day","obs","round","region","area","impound","treat","night"),sep="_")
  names <- names %>% separate(night, into=c("night","file"), sep=-5)
  int <-  read.csv(paste0("./R_in_ecology/night_files/",file_names[i]))
  lesscol <-  int[,c("lat","name")]
  lesscol$name <- as.character(lesscol$name)
  lesscol$name <- ifelse(nchar(lesscol$name)==7,paste0(lesscol$name,"N"),lesscol$name)
  lesscol <- lesscol %>% separate(name, into=c("name","distance"),sep=5)
  lesscol <- lesscol %>% separate(distance, into=c("species","distance"), sep=1)
  lesscol <- lesscol %>% separate(distance, into=c("distance","flush_walk"), sep=-2)
  lesscol$distance <- as.numeric(lesscol$distance)
  lesscol$species <- tolower(lesscol$species)
  lesscol$year <- as.numeric(names$year)
  lesscol$month <- as.numeric(names$month)
  lesscol$day <- as.numeric(names$day)
  lesscol$obs <- names$obs
  lesscol$round <- names$round
  lesscol$region <- names$region
  lesscol$area <- names$area
  lesscol$impound <- names$impound
  lesscol$treat <- names$treat
  lesscol$night <- names$night
  lesscol$odat <- ordinal_date_con(lesscol[,c("month","day","year")])
  nights[[i]] <- lesscol
}

masterdat <- do.call(rbind, nights)

# how many rails have we seen now?
nrow(masterdat)  

# how about broken down by me and my tech, because I am competitive
table(masterdat$obs, masterdat$species)

# how about by round
table(masterdat$round)
# and region
table(masterdat$region)
# how about how many are flushing vs walking when observed (N means not recorded, which is uninteresting)
table(masterdat[masterdat$flush_walk!="N",]$flush_walk)

