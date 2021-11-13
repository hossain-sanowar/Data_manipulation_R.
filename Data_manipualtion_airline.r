library(tidyverse)
library(dplyr)
df_air<-read.csv('airline.csv',header = TRUE)
df_air %>% view()

#(a) Subset: Find the carrier (UniqueCarrier), the flight number (FlightNum), and origin (ori-gin) of all the flights that:
df=df_air %>% select(DepTime,ArrDelay,DepDelay,ArrTime, FlightNum,UniqueCarrier,FlightNum, Origin,Dest)
#df
#i. Departed (DepTime) after 10pm and flew (Dest) to Nashville (’BNA’).
dept_air=df %>% select(DepTime,Origin,Dest)
dept_air_filter=dept_air %>%filter(DepTime>2200 & Dest=='BNA')             
dept_air_filter
#ii. departed (DepTime) after 10pm, but Originated (Origin) from Nashville ’BNA’ or
#landed (Dest) in Memphis ’MEM’. If you don’t get a list of four flight, something is
#wrong.
dept_dest_air=df %>% select(DepTime,Origin,Dest)
dept_dest_air=dept_air %>%filter(DepTime>2200 & (Origin=='BNA' | Dest=='MEM'))            
dept_dest_air
# iii. were delayed (ArrDelay) by more two hours. Note that a negative delay is a flight
# that arrived early.
arr_delay_air=df %>% select(ArrDelay,Origin,Dest)
arr_delay_air_filter=arr_delay_air %>%filter(ArrDelay>2)            
arr_delay_air_filter
# iv. arrived (ArrDelay) more than two hours late, but didn’t leave late (DepDelay).
arr_dep_delay_air=df %>% select(ArrDelay,DepDelay,Origin,Dest)
arr_dep_delay_air_filter=arr_dep_delay_air %>%filter((arr_dep_delay_air>2) & (DepDelay<=0))            
arr_dep_delay_air_filter

# (b) Arrange: make use of minus sign in front of the function to reverse order() and the func-
  # tion head() to get the relevant part: (Use the Airline data)
# i. Sort flights to find the 5 most delayed (DepDelay) flights
most_delay_air=df %>% arrange(desc(DepDelay))
head(most_delay_air,5L)

# ii. Sort flights to find the 5 least delayed (DepDelay) flights

least_arr_delay_filter=df%>%arrange(DepDelay)
head(least_arr_delay_filter,5L)

# iii. Sort flights by destination (Dest) and break ties by descending arrival delay (ArrDe-lay)

least_arr_delay_filter=df%>%arrange(desc(ArrDelay,Dest))
head(least_arr_delay_filter,5L)

