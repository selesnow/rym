rym_get_segments <-
  function(counter, login = NULL, token.path = getwd()) {
    
    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token
    
    answer <- GET(str_glue("https://api-metrika.yandex.ru/management/v1/counter/{counter}/segments"), 
                  add_headers(Authorization = paste0("OAuth ", ym_token)))
    
    stop_for_status(answer)
    
    raw_data <- content(answer, as = "parsed")
    
    res <- list()
    
    for (row in seq_along(1:length(raw_data$segments))) {
      
      res[[row]]  <- data.frame(id                      = raw_data$segments[[row]]$segment_id,
                                counter_id              = raw_data$segments[[row]]$counter_id,
                                name                    = raw_data$segments[[row]]$name,
                                expression              = raw_data$segments[[row]]$expression,
                                is_retargeting          = raw_data$segments[[row]]$is_retargeting,
                                segment_source          = raw_data$segments[[row]]$segment_source)
      
    }
    
    
    result <- do.call("rbind", res) 
    return(result)
  }

