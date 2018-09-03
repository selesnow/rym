rym_get_filters <-
  function(counter, login = NULL, token.path = getwd()) {
    
    # auth
    ym_token <- rym_auth(login = login, token.path = token.path)$access_token
    
    answer <- GET(str_glue("https://api-metrika.yandex.ru/management/v1/counter/{counter}/filters"), 
                  add_headers(Authorization = paste0("OAuth ", ym_token)))
    
    stop_for_status(answer)
    
    raw_data <- content(answer, as = "parsed")
    
    res <- list()

    for (row in seq_along(1:length(raw_data$filters))) {
      
      res[[row]]  <- data.frame(id                      = raw_data$filters[[row]]$id,
                                attr                    = raw_data$filters[[row]]$attr,
                                type                    = raw_data$filters[[row]]$type,
                                value                   = raw_data$filters[[row]]$value,
                                action                  = raw_data$filters[[row]]$action,
                                status                  = raw_data$filters[[row]]$status,
                                with_subdomains         = raw_data$filters[[row]]$with_subdomains,
                                start_ip                = ifelse(is.null(raw_data$filters[[row]]$start_ip), NA, raw_data$filters[[row]]$start_ip),
                                end_ip                  = ifelse(is.null(raw_data$filters[[row]]$start_ip), NA, raw_data$filters[[row]]$start_ip))
      
    }
    
    
    result <- do.call("rbind", res) 
    return(result)
  }