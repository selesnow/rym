## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  eval = FALSE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
#  # оффлайн конверсии
#  rym_enable_calls(123456789,
#                   login = 'yandex_login')
#  
#  # проверка можно ли загружать данные и за какой период
#  rym_allow_calls(123456789,
#                  login = 'yandex_login')

## ----eval=FALSE---------------------------------------------------------------
#  rym_upload_calls(12345,
#                   data = conv_data,
#                   client.id.type = "CLIENT_ID",
#                   login = 'yandex_login')

## ----eval=FALSE---------------------------------------------------------------
#  
#  uploads <- rym_get_uploadings_calls(
#                counter = 123456789,
#                login   = 'yandex_login')

