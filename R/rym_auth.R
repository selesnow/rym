rym_auth <- function(login = getOption("rym.user"), 
                     new.user = FALSE, 
                     token.path  = getOption("rym.token_path")) {
  
  # check dir
  if (!dir.exists(token.path)) dir.create(token.path)
  
  # Set login if not provided
  login <- if (!is.null(login)) login else getOption("rym.user")
  
  # Normalize path
  token.path <- gsub("\\\\", "/", token.path)
  token_file <- file.path(token.path, paste0(login, ".rymAuth.RData"))
  
  # Load token if it exists
  if (!new.user && file.exists(token_file)) {
    message("Load token from ", token_file)
    load(token_file)
    
    # Check token expiration
    if (as.numeric(difftime(token$expire_at, Sys.time(), units = "days")) < 30) {
      message("Auto refresh token")
      token_raw <- request("https://oauth.yandex.ru/token") %>%
        req_body_form(
          grant_type = "refresh_token",
          refresh_token = token$refresh_token,
          client_id = "5a87e45d5562421bb29bb9abd17321b3",
          client_secret = "04e7f096ce21483fb1c9861f68c017d7"
        ) %>%
        req_perform()
      
      token <- token_raw %>% resp_body_json()
      
      if (!is.null(token$error_description)) {
        stop(paste0(token$error, ": ", token$error_description))
      }
      
      token$expire_at <- Sys.time() + as.numeric(token$expires_in, units = "secs")
      class(token) <- "RymToken"
      save(token, file = token_file)
      
      message("Token saved in file ", token_file)
      return(token)
    } else {
      message("Token expires in ", round(difftime(token$expire_at, Sys.time(), units = "days")), " days")
      return(token)
    }
  }
  
  # Check execution mode
  if (!interactive()) {
    stop(sprintf(
      "Function rym_auth does not find the %s.rym_auth.RData file in %s. 
    You must run this script in interactive mode (RStudio or RGui) to complete the authorization process. 
    Once authorized, the token file will be saved and can be used in batch mode. 

    More details:
    - Release notes: https://github.com/selesnow/ryandexdirect/releases/tag/3.0.0
    - R modes: https://www.r-bloggers.com/batch-processing-vs-interactive-sessions/",
      login, token.path
    ))
  }
  
  # Start user authorization
  browseURL(paste0(
    "https://oauth.yandex.ru/authorize?response_type=code&client_id=5a87e45d5562421bb29bb9abd17321b3&redirect_uri=https://selesnow.github.io/rym/getToken/get_code.html&force_confirm=",
    as.integer(new.user),
    ifelse(is.null(login), "", paste0("&login_hint=", login))
  ))
  
  # Enter authorization code
  repeat {
    temp_code <- readline("Enter authorize code:")
    if (nchar(temp_code) == 16) break
    message("The verification code is not 16 characters long, try again.")
  }
  
  token_raw <- request("https://oauth.yandex.ru/token") %>%
    req_body_form(
      grant_type = "authorization_code",
      code = temp_code,
      client_id = "5a87e45d5562421bb29bb9abd17321b3",
      client_secret = "04e7f096ce21483fb1c9861f68c017d7"
    ) %>%
    req_perform()
  
  token <- token_raw %>% resp_body_json()
  
  if (!is.null(token$error_description)) {
    stop(paste0(token$error, ": ", token$error_description))
  }
  
  token$expire_at <- Sys.time() + token$expires_in
  class(token) <- "RymToken"
  
  save_path <- file.path(token.path, paste0(login, ".rymAuth.RData"))
  message("Do you want to save the API credential in a local file (", save_path, ") for use between R sessions?")
  ans <- tolower(readline("y / n (recommendation - y): "))
  
  if (ans %in% c("y", "yes", "ok", "save")) {
    save(token, file = save_path)
    message("Token saved in file ", save_path)
  }
  
  return(token)
}