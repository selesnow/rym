## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  library(rym)
#  
#  # список доступных счётчиков
#  my_counters <- rym_get_counters(login      = "ваш логин",
#                                  token.path = "metrica_token")
#  
#  # список целей
#  my_goals <- rym_get_goals(counter    = 000000000,
#                            login      = "ваш логин",
#                            token.path = "metrica_token")
#  
#  # список фильтров
#  my_filter <- rym_get_filters(counter    = 000000000,
#                               login      = "ваш логин",
#                               token.path = "metrica_token")
#  
#  # список сегментов
#  my_segments <- rym_get_segments(counter    = 000000000,
#                                  login      = "ваш логин",
#                                  token.path = "metrica_token")
#  
#  # список клиентов Яндекс Директ
#  my_clients <- rym_get_direct_clients(counters="000000000,111111111",
#                                       login = "my_login",
#                                       token.path = "metrica_token")
#  
#  # список пользователей
#  users <- rym_users_grants(counter    = 000000000,
#                            login      = "ваш логин",
#                            token.path = "metrica_token")

## ----eval=FALSE---------------------------------------------------------------
#  rym_add_goal(123456789,
#               name = 'first_goal',
#               type = 'action',
#               conditions = list(type = 'exact',
#                                 url = 'rym-first-goal'),
#               login = 'your_login')

## ----eval=FALSE---------------------------------------------------------------
#  rym_add_segment(
#       counter = 123456789,
#       name = "my_segment",
#       expression = "ym:s:trafficSource=='organic' AND ym:s:isNewUser=='Yes'",
#       login = "your_login")

