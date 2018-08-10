rym_get_counters <-
function(login = NULL, token.path = getwd()) {
  
  # auth
  ym_token <- rym_auth(login = login, token.path = token.path)$access_token
  
  answer <- GET("https://api-metrika.yandex.ru/management/v1/counters", add_headers(Authorization = paste0("OAuth ", ym_token)))
  
  stop_for_status(answer)
  
  raw_data <- content(answer, as = "parsed")
  
  res <- list()
  
  for (counter in seq_along(1:length(raw_data$counters))) {
    res[[counter]] <- data.frame(id                      = raw_data$counters[[counter]]$id,
                                 status                  = raw_data$counters[[counter]]$status,
                                 owner_login             = raw_data$counters[[counter]]$owner_login,
                                 name                    = raw_data$counters[[counter]]$name,
                                 code_status             = raw_data$counters[[counter]]$code_status,
                                 site                    = raw_data$counters[[counter]]$site,
                                 permission              = raw_data$counters[[counter]]$permission,
                                 type                    = raw_data$counters[[counter]]$type,
                                 gdpr_agreement_accepted = raw_data$counters[[counter]]$gdpr_agreement_accepted)
  }
  
  
  result <- do.call("rbind", res) 
  return(result)
}
