rym_get_logs <-
function(counter = NULL, 
                         date.from = Sys.Date() - 10, 
                         date.to = Sys.Date()-1, 
                         fields = "ym:s:date,ym:s:counterID,ym:s:dateTime,
	ym:s:isNewUser,ym:s:startURL,ym:s:visitDuration,
	ym:s:ipAddress,ym:s:referer", 
                         source = "visits", 
                         login = NULL,
                         token.path = getwd()){
  
    fun_start <- Sys.time()
    
    token <- rym_auth(login = login, token.path = token.path)$access_token
    
    #send query
    fields <- gsub("[\\s\\n\\t]","",fields,perl = TRUE) 
    logapi <- POST(paste0("https://api-metrika.yandex.ru/management/v1/counter/",counter,"/logrequests?date1=",date.from,"&date2=",date.to,"&fields=",fields,"&source=",source,"&oauth_token=",token))
    queryparam <- content(logapi, "parsed", "application/json")
    
    #check error
    if(!is.null(queryparam$errors)){
      stop(paste0(queryparam$errors[[1]][[1]]," - ",queryparam$errors[[1]][[2]], ", error code - ", queryparam$code))
    }
    
    #variables
    request_id <- queryparam$log_request$request_id
    request_status <- queryparam$log_request$status
    
    #time counter
    start_time <- Sys.time()
    
    #pause
    Sys.sleep(7)
    
    #start message
    packageStartupMessage("Processing ", appendLF = FALSE)
    
    #check status
    while(request_status != "processed"){
      logapistatus <- GET(paste0("https://api-metrika.yandex.ru/management/v1/counter/",counter,"/logrequest/",request_id,"?oauth_token=",token))
      request_status <- content(logapistatus, "parsed", "application/json")$log_request$status
      
      #status
      packageStartupMessage(".", appendLF = FALSE)
      
      #get parts number of results
      partsnun <- length(content(logapistatus, "parsed", "application/json")$log_request$parts)
      
      #get parts of log
      if(request_status == "processed"){
        #message
        packageStartupMessage(paste0(" processing time ",round(Sys.time() - start_time,2)," sec"), appendLF = TRUE)
        
        #create res df
        result <- data.frame()
        
        #message about start loading
        packageStartupMessage("Loading ", appendLF = FALSE)
        start_load_time <- Sys.time()
        for(parts in 0:partsnun-1){
          packageStartupMessage(".", appendLF = FALSE)
          #get data
          logapidata <- GET(paste0("https://api-metrika.yandex.ru/management/v1/counter/",counter,"/logrequest/",request_id,"/part/",parts,"/download?oauth_token=",token))
          rawdata <- try(content(logapidata,"text","application/json",encoding = "UTF-8"), silent = T)
          df_temp <- try(read.delim(text=rawdata), silent = T)
          result <- rbind(result, df_temp)
        }
        #message
        packageStartupMessage(paste0(" done! ", "loading time ",round(Sys.time() - start_load_time,2)," sec"))
        
        #remove from server
        req_delite <- POST(paste0("https://api-metrika.yandex.ru/management/v1/counter/",counter,"/logrequest/",request_id,"/clean?oauth_token=",token))
        req_delite <- content(req_delite, "parsed", "application/json")
        #total info
        packageStartupMessage("Information: ")
        packageStartupMessage(paste0("Request id: ", request_id))
        packageStartupMessage(paste0("Request status: ", req_delite$log_request$status))
        packageStartupMessage(paste0("Total time: ", round(Sys.time() - fun_start,2)," sec"))
        packageStartupMessage(paste0("Data size: ",round(req_delite$log_request$size * 1e-6,2), " Mb"))
        packageStartupMessage(paste0("Return rows: ",nrow(result)))                   
        if(exists("result")){
          packageStartupMessage("Data load successful!")
        }
        return(result)
      }
      
      #stop on error
      if(request_status == "processing_failed"){
        stop("Error in request processing")
      }
	  
      #stop if canceled
      if(request_status == "canceled"){
        stop("Request canceled")
      }
      
      #Delete
      if(request_status == "cleaned_by_user"|request_status == "cleaned_automatically_as_too_old"){
        stop("Request delete")
      }
      
      #5 sec pause before next query
      Sys.sleep(5)
    }
  }
