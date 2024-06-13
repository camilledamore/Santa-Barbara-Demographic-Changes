#clear environment
rm(list=ls()) 

#Import pkgs 
library(tidyverse) 

#import ACS data

CA_Hisp_Demographic_Data  <- read.csv("ACS_2011_2021_Hispanic_Data.csv")


## ----- 2011 data for all counnties --------- ##

# Total number of people surveyed 2011 (practicing sums and using variables ($))
CA_TOTAL_2011 <- 
  sum(CA_Hisp_Demographic_Data$Not.Hispanic_2011, na.rm = TRUE) + 
  sum(CA_Hisp_Demographic_Data$Mexican_2011, na.rm = TRUE) + 
  sum(CA_Hisp_Demographic_Data$Puerto.Rican_2011, na.rm = TRUE) + 
  sum(CA_Hisp_Demographic_Data$Cuban_2011, na.rm = TRUE) + 
  sum(CA_Hisp_Demographic_Data$Other.Hispanic_2011, na.rm = TRUE)

#calculate demograohic distributions (percents) for ALL counties 
Percentages2011 <- c(
  sum(CA_Hisp_Demographic_Data$Not.Hispanic_2011, na.rm = TRUE) / CA_TOTAL_2011 * 100,
  sum(CA_Hisp_Demographic_Data$Mexican_2011, na.rm = TRUE) / CA_TOTAL_2011 * 100,
  sum(CA_Hisp_Demographic_Data$Puerto.Rican_2011, na.rm = TRUE) / CA_TOTAL_2011 * 100,
  sum(CA_Hisp_Demographic_Data$Cuban_2011, na.rm = TRUE) / CA_TOTAL_2011 * 100,
  sum(CA_Hisp_Demographic_Data$Other.Hispanic_2011, na.rm = TRUE) / CA_TOTAL_2011 * 100
)



#Same for 2021 data

CA_TOTAL_2021 <- sum(CA_Hisp_Demographic_Data$Not.Hispanic_2021, na.rm = TRUE) + 
  sum(CA_Hisp_Demographic_Data$Mexican_2021, na.rm = TRUE) + 
  sum(CA_Hisp_Demographic_Data$Puerto.Rican_2021, na.rm = TRUE) + 
  sum(CA_Hisp_Demographic_Data$Cuban_2021, na.rm = TRUE) + 
  sum(CA_Hisp_Demographic_Data$Other.Hispanic_2021, na.rm = TRUE)


Percentages2021 <- c(
  sum(CA_Hisp_Demographic_Data$Not.Hispanic_2021, na.rm = TRUE) / CA_TOTAL_2021 * 100,
  sum(CA_Hisp_Demographic_Data$Mexican_2021, na.rm = TRUE) / CA_TOTAL_2021 * 100,
  sum(CA_Hisp_Demographic_Data$Puerto.Rican_2021, na.rm = TRUE) / CA_TOTAL_2021 * 100,
  sum(CA_Hisp_Demographic_Data$Cuban_2021, na.rm = TRUE) / CA_TOTAL_2021 * 100,
  sum(CA_Hisp_Demographic_Data$Other.Hispanic_2021, na.rm = TRUE) / CA_TOTAL_2021 * 100
)



#combine dfs and plot 2011 and 2021 data side-by-side (use bar)


combined_not_Hispanic_2011_2021 <- c(ethnicPercentages2011[1],ethnicPercentages2021[1])
Combined_2011_2021<-cbind(ethnicPercentages2011,ethnicPercentages2021)

barplot(combined_not_Hispanic_2011_2021)



##----Calc percents for Santa Barbara county only----##

#2011
SB_TOTAL_2011 <- CA_Hisp_Demographic_Data %>% 
  filter(county=="Santa Barbara") %>% 
  select((contains("2011"))) %>% 
  rowSums()

SB_Percentages_2011_pre <- CA_Hisp_Demographic_Data %>% 
  filter(county=="Santa Barbara") %>% 
  select((contains("2011")))

SB_Percentages_2011 <- (SB_Percentages_2011_pre / SB_TOTAL_2011) *100




SB_TOTAL_2021 <- CA_Hisp_Demographic_Data %>% 
  filter(county=="Santa Barbara") %>% 
  select((contains("2021"))) %>% 
  rowSums()

SB_Percentages_2021_pre <- CA_Hisp_Demographic_Data %>% 
  filter(county=="Santa Barbara") %>% 
  select((contains("2011")))

SB_Percentages_2021 <- (SB_Percentages_2021_pre / SB_TOTAL_2021) *100


# fin !




