rym_get_uploadings_expense <-
  function(counter, 
           login      = getOption("rym.user"), 
           token.path = getOption("rym.token_path")) {
    
    
    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token
    
    result <- data.frame()
    
    limit  <- 10000
    offset <- 0
    
    result <- list()
    
    while ( TRUE ) { 
      
      answer <- GET(str_glue("https://api-metrika.yandex.net/management/v1/counter/{counter}/expense/uploadings"),
                    query = list(limit  = limit,
                                 offset = offset),
                    add_headers(Authorization = paste0("OAuth ", ym_token)))
      
      stop_for_status(answer)
      
      raw_data <- content(answer, as = "parsed")
      
      # stop if empty
      if ( length(raw_data$uploadings) == 0 ) break
      
      result <- append(result, raw_data$uploadings)
      
      offset <- offset + limit
    }
    
    # parse result
    result <- map_df(result, flatten)
    
    return(result)
  }
