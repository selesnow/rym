rym_get_my_logins <- function(token.path = getOption("rym.token_path"), set.login = TRUE) {
  
  if ( is.null(token.path) ) {
    token.path <- getwd()
  }
  
  files  <- dir(token.path, pattern = "\\.rymAuth\\.RData$")
  logins <- gsub("\\.rymAuth\\.RData$", replacement = "", files)
  
  if ( length(files) == 0 ) {
    
    message("You does't have any authorize login.")
    auth <- readline("Do you want start authorize process? ( y / n ): ")
    
    if (auth == "y") {
      
      if ( is.null(getOption("rym.user")) ) {
        
        login <- readline("Enter your Yandex login:")

      } else {
        
        login <- getOption("rym.user")
        
      }
     
      rym_auth(login = login)
      
      return(login)
       
    } else {
      
      return(NULL)
      
    }
  }
  
  for ( i in 1:length(logins) ) {
    
    cat(i, ":\t", logins[i], "\n")
    
  }
  
  if (set.login) {
    
    len          <- length(logins)
    login_number <- readline(str_glue("Choose login (enter number from 1 to {len}): "))
    login        <- logins[as.integer(login_number)]
    options(rym.user = login)
    message(str_glue("Set {login} as default session login"))
    return(login)
    
  }
  
  return(logins)
  
}
