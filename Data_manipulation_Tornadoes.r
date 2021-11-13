library(tidyverse)
library(dplyr)
df_tor<-read.csv('tornado.csv',header=TRUE)

#(a) How many tornadoes occurred in WA (Washington) or MS (Mississippi)?
x_tor=df_tor %>% 
  count(st)
names(x_tor)=c("State", "Countnumber")
x_tor_filter=x_tor%>% filter(State=='MS' | State=='WA')             
x_tor_filter
#(b) How many tornadoes occurred in WA after 2012?
df_tor_2012<-df_tor %>% filter(yr>2012)
  # view()
x_tor_2012=df_tor_2012 %>% 
  count(st)
names(x_tor_2012)=c("State", "Countnumber")
x_tor_filter_2012=x_tor_2012%>% filter(State=='WA')             
x_tor_filter_2012
#(c) Get all tornadoes that occurred in WA in 2012, 2013, and 2014.
df_tor_2012_2014<-df_tor %>% filter(yr>=2012 & yr<=2014) #%>% view()
x_tor_2012_2014=df_tor_2012_2014 %>% 
  count(st)
names(x_tor_2012_2014)=c("State", "Countnumber")
x_tor_filter_2012_2014=x_tor_2012_2014%>% filter(State=='WA')             
x_tor_filter_2012_2014
#(d) Return the ’mo’ (month), ’yr’ (year), and ’f’ (F-scale) for all tornadoes that occurred in HI (Hawaii).
x_tor_hi=df_tor %>% select('mo','yr','f','st')
x_tor_filter_hi=x_tor_hi%>% filter(st=='HI')             
x_tor_filter_hi
#(e) Arrange the tornadoes by date and time. What state had the most recent tornado?
df_tor_recent=df_tor %>% 
  arrange(desc(date,time))
df_tor_recent
df_tor_recent$st[1]
  
#(f) Get the count of tornadoes by months.
x_tor_months=df_tor %>% 
  count(mo)
names(x_tor_months)=c("Month", "Countnumber")
x_tor_months

