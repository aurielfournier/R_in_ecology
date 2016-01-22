# survey_cleaning_2015

int <- read.csv("./R_in_ecology/example_survey_data.csv")

regions <- c("nw","nc","ne","se")

fs <- c("fed","stat")

print(paste0(int[(int$region %in% regions==FALSE),]$region," "," region"))
print(paste0(int[(int$fs %in% fs==FALSE),]$area," "," area"))
is.numeric(dat$sora)
is.numeric(dat$jdate)

int230 <- int[int$jdate<=230,]
int260 <- int[int$jdate<=260,]

mint <- melt(data=int[,c("jdate","sora")], id=c("jdate"))
cint <- cast(data=mint, jdate ~ variable, median)
 
ggplot(data=cint[cint$jdate<=uni[i],])+
  geom_bar(aes(x=jdate, y=sora), stat="identity")+
  theme_krementz()+
  xlim(min(int$jdate),max(int$jdate))
