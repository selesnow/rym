## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE--------------------------------------------------------------
#  # данные для загрузки
#  expense <- data.frame(Date        = c("2020-06-01",
#                                        "2020-06-02"),
#                        UTMSource   = c("test_s_1",
#                                        "test_s_2"),
#                        Expenses    = c(88.12,
#                                        92.11),
#                        UTMMedium   = c("cpc",
#                                        "cpm"),
#                        UTMCampaign = c("camp1",
#                                        "camp2"),
#                        UTMTerm     = c("term1",
#                                        "term2"),
#                        UTMContent  = c("cont1",
#                                        "cont2"),
#                        Currency    = c("RUB",
#                                        "RUB"),
#                        Clicks      = c(11, 15))
#  
#  # отправка данных в Яндекс.Метрику
#  rym_upload_expense(counter = 11111,
#                     data    = expense,
#                     login   = 'yandex_login',
#                     token.path = "D:/packlab/rym")
#  
#  # Удаление данных из Яндекс.Метрики
#  rym_delete_uploaded_expense(counter = 11111,
#                              data    = expense,
#                              login   = 'yandex_login',
#                              token.path = "D:/packlab/rym")
#  
#  # получение списка загрузок
#  loaded <- rym_get_uploadings_expense(counter = 11111,
#                                       login   = 'yandex_login',
#                                       token.path = "D:/packlab/rym")
#  

