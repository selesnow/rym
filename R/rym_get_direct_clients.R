rym_get_direct_clients <-
  function(counters, login = getOption("rym.user"), 
           token.path = getOption("rym.token_path")) {
    
    # check path
    if ( is.null(token.path) ) {
      token.path <- getwd()
    }
    
    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token
    
    answer <- GET(str_glue("https://api-metrika.yandex.ru/management/v1/clients?counters={counters}"), 
                  add_headers(Authorization = paste0("OAuth ", ym_token)))
    
    stop_for_status(answer)
    
    raw_data <- content(answer, as = "parsed")
    
    res <- list()
    
    for (row in seq_along(1:length(raw_data$clients))) {
      
      res[[row]]  <- data.frame(id          = raw_data$clients[[row]]$id,
                                name        = raw_data$clients[[row]]$name,
                                chief_login = raw_data$clients[[row]]$chief_login)
      
    }
    
    
    result <- do.call("rbind", res) 
    return(result)
  }

