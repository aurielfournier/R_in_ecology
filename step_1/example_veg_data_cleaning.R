library(tidyr)
library(dplyr)

file_names <- list.files("./R_in_ecology/veg_files/",pattern=".csv")

vegsheets <- list()

areas <- c("nvca","scnwr","fgca","slnwr","tsca","bkca","ccnwr","dcca","osca","tmpca")


regions <- c("nw","nc","ne","se")

plant <- c("reed canary grass","primrose","millet","bulrush","partridge pea","spikerush","a smartweed","p smartweed","willow","tree","buttonbush","arrowhead","river bulrush","biden","upland","cocklebur","lotus","grass","cattail","prairie cord grass","plantain","sedge","sesbania","typha","corn","sumpweed","toothcup","frogfruit","canola","sedge","crop","rush","goldenrod",NA)

for(i in 1:length(file_names)){
  int <-  read.csv(paste0("./R_in_ecology/veg_files/",file_names[i]))
  print(paste0(int[(int$region %in% regions==FALSE),]$region," ",file_names[i]," region"))
  print(paste0(int[(int$area %in% areas==FALSE),]$area," ",file_names[i]," area"))

  print(paste0(int[(int$plant1 %in% plant==FALSE),]$plant1," ",file_names[i]," plant1"))
}

# if this returns a list of everything with no misspelled things we are good to go. 

for(i in 1:length(file_names)){
  vegsheets[[i]] <- read.csv(paste0("./R_in_ecology/veg_files/",file_names[i]))
}

# now we read them all in again, rbind them together and then we can write it out into a master file. 

masterdat <- do.call(rbind, vegsheets)