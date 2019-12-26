rym_get_data <-
function(direct.client.logins = NULL,
         counters             = NULL,
         metrics              = "ym:s:visits,ym:s:pageviews,ym:s:users",
         dimensions           = NULL,
         filters              = NULL,
         sort                 = NULL,
         date.from            = "8daysAgo",
         date.to              = "yesterday",
         accuracy             = "full",
         include.undefined    = TRUE,
         lang                 = "ru",
         timezone             = NULL,
         pretty               = FALSE,
         login                = NULL,
         token.path           = getwd()) {

  # auth
  ym_token <- rym_auth(login = login, token.path = token.path)$access_token
 
  # check counters
  if ( is.null() ) {
    counters <- rym_get_counters(login, token.path)
  }
  
  limit    <- 100000
  offset   <- 1

  out_rows <- 1

  result  <- list()
  
  # prepaire parameters
  counters   <- paste0(counters,   collapse = ",")
  metrics    <- paste0(metrics,    collapse = ",")
  dimensions <- paste0(dimensions, collapse = ",")

  # total rows
  ans <- GET(url = "https://api-metrika.yandex.ru/stat/v1/data",
             query = list(direct_client_logins = direct.client.logins,
                          ids                  = gsub("[\\s\\n\\t]", "", counters, perl = TRUE),
                          metrics              = gsub("[\\s\\n\\t]", "", metrics, perl = TRUE),
                          date1                = date.from,
                          date2                = date.to,
                          accuracy             = accuracy,
                          dimensions           = gsub("[\\s\\n\\t]", "", dimensions, perl = TRUE),
                          filters              = filters,
                          sort                 = sort,
                          timezone             = timezone,
                          include_undefined    = include.undefined,
                          lang                 = tolower(lang),
                          pretty               = pretty,
                          timezone             = timezone,
                          limit                = 1),
             add_headers(Authorization = paste0("OAuth ", ym_token)))

  check <- content(ans)

  if ( !is.null(check$errors) ) {
    stop(check$code, ": ", check$message)
  }

  while (out_rows > 0) {
  answer <- GET(url = "https://api-metrika.yandex.ru/stat/v1/data.csv",
                query = list(direct_client_logins = direct.client.logins,
                             ids                  = gsub("[\\s\\n\\t]", "", counters, perl = TRUE),
                             metrics              = gsub("[\\s\\n\\t]", "", metrics, perl = TRUE),
                             date1                = date.from,
                             date2                = date.to,
                             accuracy             = accuracy,
                             dimensions           = gsub("[\\s\\n\\t]", "", dimensions, perl = TRUE),
                             filters              = filters,
                             sort                 = sort,
                             timezone             = timezone,
                             include_undefined    = include_undefined,
                             lang                 = tolower(lang),
                             pretty               = pretty,
                             timezone             = timezone,
                             limit                = format(limit, scientific = FALSE ),
                             offset               = offset),
                add_headers(Authorization = paste0("OAuth ", ym_token)))

  # result pars
  data <- suppressMessages(content(answer, as = "parsed", "text/csv")[-1, ])

  offset <- offset + limit
  out_rows <- nrow(data)

  if (out_rows > 0) {
    result[[length(result) + 1]] <- data
    }
  }

  my_data <- do.call("rbind", result)

  return(my_data)
}
