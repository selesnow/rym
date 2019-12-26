rym_get_goals <-
function(counter, login = getOption("rym.user"), 
         token.path = getOption("rym.token_path")) {
  
  # check path
  if ( is.null(token.path) ) {
    token.path <- getwd()
  }
  
  # auth
  ym_token <- rym_auth(login = login, token.path = token.path)$access_token
  
  answer <- GET(str_glue("https://api-metrika.yandex.ru/management/v1/counter/{counter}/goals"), 
                add_headers(Authorization = paste0("OAuth ", ym_token)))
  
  stop_for_status(answer)
  
  raw_data <- content(answer, as = "parsed")
  
  res <- list()
  goal <- 3
  
  raw_data$goals[[goal]]$conditions
  
  for (goal in seq_along(1:length(raw_data$goals))) {
    
    res[[goal]] <- data.frame(id                      = raw_data$goals[[goal]]$id,
                                 name                    = raw_data$goals[[goal]]$name,
                                 type                    = raw_data$goals[[goal]]$type,
                                 is_retargeting          = raw_data$goals[[goal]]$is_retargeting,
                                 conditions              = paste(names(unlist(raw_data$goals[[goal]]$conditions)), unlist(raw_data$goals[[goal]]$conditions), sep = ":", collapse = ", "))
    
  }
  
  
  result <- do.call("rbind", res) 
  return(result)
}
