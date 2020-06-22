# prepare data
expense <- data.frame(Date        = c("2020-06-01",
                                      "2020-06-02"),
                      UTMSource   = c("test_s_1",
                                      "test_s_2"),
                      Expenses    = c(88.12,
                                      92.11),
                      UTMMedium   = c("cpc",
                                      "cpm"),
                      UTMCampaign = c("camp1",
                                      "camp2"),
                      UTMTerm     = c("term1",
                                      "term2"),
                      UTMContent  = c("cont1",
                                      "cont2"),
                      Currency    = c("RUB", 
                                      "RUB"),
                      Clicks      = c(11, 15))

rym_upload_expense(counter = 22584910, 
                   data    = expense,
                   login   = 'selesnow', 
                   token.path = "D:/packlab/rym")

rym_delete_uploaded_expense(counter = 22584910, 
                            data    = expense,
                            login   = 'selesnow', 
                            token.path = "D:/packlab/rym")


loaded <- rym_get_uploadings_expense(counter = 22584910, 
                                     login   = 'selesnow', 
                                     token.path = "D:/packlab/rym")


# #####################
# создание цели
rym_add_goal(22584910, 
             name = 'first_goal',
             type = 'action',
             conditions = list(type = 'exact', url = 'rym-first-goal'),
             login = 'selesnow')
             

# #####################
# оффлайн конверсии
ans <- rym_allow_offline_conversion(22584910, login = 'selesnow')
ans <- rym_switch_on_offline_conversion(22584910, login = 'selesnow') 
ans <- rym_switch_off_offline_conversion(22584910, login = 'selesnow') 

clid <- rym_get_logs(counter = 22584910,
                     date.from = '2020-06-14',
                     date.to = "2020-06-15",
                     fields = "ym:s:clientID",source = 'visits',login = 'selesnow')

library(rym)
clid <- rym_get_data(counters = 22584910, 
                     date.from = "2020-06-16",
                     date.to = '2020-06-16',
                     dimensions = 'ym:s:date,ym:s:clientID',
                     metrics = "ym:s:visits,ym:s:pageviews",
                     login = 'selesnow'
                     )
library(httr)
options(scipen = 999)
clid$ClientID
getProxy::getProxy()
conv_data <- data.frame(ClientId = c(1592289353101937920,1592307890345519616),
                        Target = c('offline-order-test', 'offline-order-test'),
                        DateTime = c(1592335811, 1592392352),
                        Price    = c(122.65, 134.11),
                        Currency = c("USD", "USD"))
1592392352
as.numeric(as.POSIXct("2020-06-17 11:12:32 UTC"))


rym_upload_offline_conversion(counter = 22584910, 
                              data = conv_data,
                              client.id.type = "CLIENT_ID", 
                              login = 'selesnow')

ups <-
rym_get_uploadings_offline_conversions(counter = 22584910,
                                       login = 'selesnow')

# корректная конвертация в unixtime
library(lubridate)
utc <- ymd_hms(c("2020-06-17 11:12:32"))
as.numeric(utc) == 1592392352


call_data <- data.frame(ClientId = c(1592289353101937920,1592307890345519616),
                        Target = c('offline-order-test', 'offline-order-test'),
                        DateTime = c(1592335811, 1592392352),
                        Price    = c(122.65, 134.11),
                        Currency = c("USD", "USD"))

call_data <- data.frame(ClientId = c(1592107552972089728,1591998562795512992),
                        PhoneNumber  = c("+70123456789", "+70423436719"),
                        TalkDuration = c(91, 176),
                        DateTime = c(as.numeric(as.POSIXct("2020-06-14 2:01:46 EST")), as.numeric(as.POSIXct("2020-06-15 1:03:11 EST"))),
                        Price    = c(100.11, 130.01),
                        Currency = c("USD", "USD"))




  
raw_data <- 
rym_upload_calls(counter = 22584910,
                 data = call_data,
                 new.goal.name = "call_test",
                 client.id.type = "CLIENT_ID",
                 login = 'selesnow')

calls <- rym_get_uploadings_calls(counter = 22584910, login = 'selesnow')
conv <- rym_get_uploadings_offline_conversions(counter = 22584910, login = 'selesnow')

getProxy::getProxy(port = '3128')
getProxy::getProxy(action = 'stop')
library(stringr)
library(jsonlite)

# #####################
# звонки
ans <- rym_allow_calls(22584910, login = 'selesnow')
ans <- rym_switch_on_calls(22584910, login = 'selesnow') 
ans <- rym_switch_off_offline_conversion(22584910, login = 'selesnow') 