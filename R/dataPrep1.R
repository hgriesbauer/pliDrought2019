treeData<-pliDat

ringData<-pliDat

pliDat<-list(treeData,ringData)


x<-
pliDat %>% 
  pluck("ringData") %>% 
  mutate(site=replace(site,site=="CA","CarmiA")) %>% 
  mutate(site=replace(site,site=="CB","CarmiB")) %>% 
  dplyr::select(Opening=site,coreID,Plot=plot,Tree.Num=treeID,Year=year,Type=coreType,Value=value) %>% 
  mutate(Opening=as.factor(Opening)) %>% 
  mutate(Year=as.integer(Year)) %>% 
  mutate(Type=as.factor(Type)) %>% 
  mutate(Plot=as.factor(Plot)) %>% 
  mutate(Tree.Num=as.factor(Tree.Num))
  
ringData<-
 x

treeData<-
  pliDat$treeData %>% 
  # rename(Tree.Num=`Tree #`) %>% 
  mutate(Opening=as.factor(Opening)) %>% 
  mutate(Plot=as.factor(Plot)) %>% 
  mutate(Tree.Num=as.factor(Tree.Num))
  

pliDat<-list(treeData=treeData,ringData=ringData)


x <-
  pliDat$ringData %>% 
  group_by(Opening,Plot) %>% 
  distinct(Tree.Num) %>% 
  mutate(ringData="yes") 

treeData<-  
  treeData %>%   
  left_join(x,by=c("Opening","Plot","Tree.Num")) 

save(pliDat,file="pliDat.RData")
