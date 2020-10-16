## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  # создаём цель
#  rym_add_goal(123456789,
#               name = 'Заказ оплачен',
#               type = 'action',
#               conditions = list(type = 'exact',
#                                 url  = 'order_confirmed'),
#               login = 'yandex_login')

## ----eval=FALSE---------------------------------------------------------------
#  # оффлайн конверсии
#  rym_enable_offline_conversion(123456789,
#                                login = 'yandex_login')
#  
#  # проверка можно ли загружать данные и за какой период
#  rym_allow_offline_conversion(123456789,
#                               login = 'yandex_login')

## ----eval=FALSE---------------------------------------------------------------
#  rym_upload_offline_conversion(12345,
#                                data = conv_data,
#                                client.id.type = "CLIENT_ID",
#                                login = 'yandex_login')

## ----eval=FALSE---------------------------------------------------------------
#  
#  uploads <- rym_get_uploadings_offline_conversions(
#                counter = 123456789,
#                login   = 'yandex_login')

