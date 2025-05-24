rym_auth <-
  function(login = getOption("rym.user"), 
           new.user = FALSE, 
           token.path = getOption("rym.token_path")) {
    
    # check path
    if ( is.null(token.path) ) {
      
      token.path <- getwd()
      
    }
    
    # check directory
    if (!dir.exists(token.path)) {
      dir.create(token.path)
    }
    
    # token save
    
    if (new.user == FALSE && file.exists(paste0(paste0(token.path, "/", login, ".rymAuth.RData")))) {
      message("Load token from ", paste0(paste0(token.path, "/", login, ".rymAuth.RData")))
      load(paste0(token.path, "/", login, ".rymAuth.RData"))
      # check token expire
      if (as.numeric(token$expire_at - Sys.time(), units = "days") < 30) {
        message("Auto refresh token")
        token_raw <- httr::POST("https://oauth.yandex.ru/token", body = list(
          grant_type = "refresh_token",
          refresh_token = token$refresh_token,
          client_id = "5a87e45d5562421bb29bb9abd17321b3",
          client_secret = "04e7f096ce21483fb1c9861f68c017d7"
        ), encode = "form")
        # check error
        if (!is.null(token$error_description)) {
          stop(paste0(token$error, ": ", token$error_description))
        }
        # parser
        token <- content(token_raw)
        
        # add info about expire time and login
        token$expire_at <- Sys.time() + as.numeric(token$expires_in, units = "secs")
        token$username  <- login
        
        # save auth token
        class(token) <- "RymToken"
        
        # save
        save(token, file = paste0(token.path, "/", login, ".rymAuth.RData"))
        message("Token rewrite in file ", paste0(token.path, "/", login, ".rymAuth.RData"))
        
        # set login
        options(rym.user = login)
        
        return(token)
      } else {
        message("Token expire in ", round(as.numeric(token$expire_at - Sys.time(), units = "days"), 0), " days")
        
        # set login
        options(rym.user = login)
        
        return(token)
      }
    }
    # if we dont find token file start a auth procedure
    browseURL(paste0("https://oauth.yandex.ru/authorize?response_type=code&client_id=5a87e45d5562421bb29bb9abd17321b3&redirect_uri=https://selesnow.github.io/rym/getToken/get_code.html&force_confirm=", as.integer(new.user), ifelse(is.null(login), "", paste0("&login_hint=", login))))
    # read auth code
    temp_code <- readline(prompt = "Enter authorize code:")
    
    # check code
    # check code - updated to 16 characters
    while (nchar(gsub("[^0-9A-Za-z]", "", temp_code)) != 16) {
      message("The verification code should be exactly 16 characters long (digits and letters), please try again.")
      temp_code <- readline(prompt = "Enter authorize code:")
    }
    
    token_raw <- request("https://oauth.yandex.ru/token") %>%
      req_body_form(
        grant_type = "refresh_token",
        refresh_token = token$refresh_token,
        client_id = "5a87e45d5562421bb29bb9abd17321b3",
        client_secret = "04e7f096ce21483fb1c9861f68c017d7"
      ) %>%
      req_perform()
    
    # Извлекаем JSON
    token <- token_raw %>% resp_body_json()
    
    # token class
    class(token) <- "RymToken"
    
    # add info about expire time and login
    token$expire_at <- Sys.time() + as.numeric(token$expires_in, units = "secs")
    token$username  <- login
    
    # check error
    if (!is.null(token$error_description)) {
      stop(paste0(token$error, ": ", token$error_description))
    }
    
    # save token in file
    message("Do you want save API credential in local file (", paste0(token.path, "/", login, ".rymAuth.RData"), "), for use it between R sessions?")
    ans <- readline("y / n (recomedation - y): ")
    
    if (tolower(ans) %in% c("y", "yes", "ok", "save")) {
      save(token, file = paste0(token.path, "/", login, ".rymAuth.RData"))
      message("Token saved in file ", paste0(token.path, "/", login, ".rymAuth.RData"))
    }
    
    # set login
    options(rym.user = login)
    return(token)
  }
