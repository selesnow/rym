rym_get_ga <-
function (start.date = "10daysAgo",
                        end.date = "today",
                        counter = NULL,
                        dimensions = "ga:date,ga:sourceMedium",
                        metrics = "ga:sessions,ga:bounces,ga:users",
                        filters = NULL,
                        sort = NULL,
                        sampling.level = "HIGHER_PRECISION",
                        login = NULL,
                        token.path = getwd()){
  
  #check args
  if(is.null(counter)){
    stop("Argument counter is require!")
  }
  
  token <- rym_auth(login = login, token.path = token.path)$access_token
  
  #check opts StringAsFactor
  if(getOption("stringsAsFactors") == TRUE){
    string_as_factor <- "change"
    options(stringsAsFactors = F)
  } else {
    string_as_factor <- "no change"
  }
  
  #create df
  result <- data.frame(stringsAsFactors = F)
  
  #remove spaces
  metrics <- gsub("[\\s\\n\\t]", "", metrics, perl = TRUE)
  
  #variables for offse
  max_results <- 4000
  start_index <- 1
  last_query <- FALSE
  
  packageStartupMessage("Processing", appendLF = F)
  
  while(last_query == FALSE){
    
    #GET
    #params
    query <- paste0("start-date=",start.date,"&end-date=",end.date,"&metrics=",metrics,"&ids=",counter,"&max-results=",max_results,"&start-index=",start_index,"&oauth_token=",token)
    #add params to query
    if(!is.null(dimensions)) {
      dimensions <- gsub(" ", "",dimensions)
      query <- paste0(query,"&dimensions=",dimensions)}
    if(!is.null(filters)) query <- paste0(query,"&filters=",filters)
    if(!is.null(sort)) query <- paste0(query,"&sort=",sort)
    if(!is.null(sampling.level)) query <- paste0(query,"&samplingLevel=",sampling.level)
    
    #chnge spec character
    query <- gsub(":","%3a",query)
    #url+params
    query <- paste0("https://api-metrika.yandex.ru/analytics/v3/data/ga?", query)
    #send query
    answer <- GET(query)
    #parsing result
    rawData <- content(answer, "parsed", "application/json")
    
    #check result
    if(!is.null(rawData$error)){
      stop(paste0(rawData$error$errors[[1]]$reason," - ",rawData$error$errors[[1]]$message, ", location - ", rawData$error$errors[[1]]$location))
    }
    
    #get field names
    column_names <- unlist(lapply(rawData$columnHeader, function(x) return(x$name)))
    
    #get rows
    rows <- lapply(rawData$rows, function(x) return(x))
    for(rows_i in 1:length(rows)){
      result <- rbind(result, unlist(rows[[rows_i]]))
    }
    #point
    packageStartupMessage(".", appendLF = F)
    #next page
    start_index <- start_index + max_results
    
    #last page or not
    if(rawData$totalResults < start_index){
      last_query <- TRUE
    }
  }
  
  #col names
  colnames(result) <- column_names
  
  #data types change
  for(tape_i in 1:length(rawData$columnHeaders)){
    
    if(rawData$columnHeaders[[tape_i]]$columnType == "METRIC"){
      result[,tape_i] <- as.numeric(result[,tape_i])
    }
  }
  
  #opts 
  if(string_as_factor == "change"){
    options(stringsAsFactors = T)
  }
  
  #message 
  packageStartupMessage("Done", appendLF = T)
  
  #total info
  if(rawData$containsSampledData == TRUE){
    packageStartupMessage("You get data with sampling.", appendLF = T)
    packageStartupMessage(paste0("sample size on which the report is compiled: ", rawData$sampleSize), appendLF = T)
    packageStartupMessage(paste0("reportbuild on ",  as.integer(rawData$sampleSize) / as.integer(rawData$sampleSpace) * 100, "% of all data"), appendLF = T)
    packageStartupMessage(paste0("Total results: ", rawData$totalResults), appendLF = T)
  } else {
    packageStartupMessage("Sampling was not used to collect data.", appendLF = T)
    packageStartupMessage(paste0("Total results: ", rawData$totalResults), appendLF = T)
  }
  #return result
  return(result)
}
