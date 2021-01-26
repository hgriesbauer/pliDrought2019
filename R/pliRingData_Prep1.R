# Pli drought mortality data
# Crossdating 

library(tidyverse)
library(here)
library(dplR)
library(ggplot2)

# Load Pli ring data
load(here("data","pliDat.RData"))

# Pull the cores from one site to examine using spaghetti plots
levels(pliDat$ringData$Opening)
siteName=levels(pliDat$ringData$Opening)[4]

# Assign x
x<-
  pliDat %>% 
  pluck(.,"ringData") %>% 
  filter(Type=="rw") %>% 
  filter(Opening %in% siteName) %>% 
  filter(Year>=1980) %>% 
  dplyr::select(coreID,Year,Value) %>%
  pivot_wider(names_from="coreID",values_from="Value") %>% 
  arrange(Year) %>% 
  
  pivot_longer(cols=-1,names_to="coreID",values_to = "value")

# Plotting
x %>% 
  ggplot(aes(x=Year,y=value))+
  geom_bar(stat="identity")+
  facet_wrap(~coreID,ncol=2,scales="free_y")


# Assign site for writing to csv and exploring more in CDendro
x<-
  pliDat %>% 
  pluck(.,"ringData") %>% 
  filter(Type=="rw") %>% 
  filter(Opening %in% siteName) %>% 
  filter(Year>=1960) %>% 
  dplyr::select(coreID,Year,Value) %>%
  pivot_wider(names_from="coreID",values_from="Value") %>% 
  arrange(Year)

names(x)[2:ncol(x)]<-paste("core",names(x)[2:ncol(x)])

write.csv(x,file=paste(siteName,"_rwDATA.csv"))
