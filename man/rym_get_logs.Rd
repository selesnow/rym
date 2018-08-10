\name{rym_get_logs}
\alias{rym_get_logs}
\title{
Get raw data from yandex metrika.
}
\description{
Logs API allows you to receive non-aggregated data collected by Yandex.Metric. 
This API is intended for service users who want to independently process 
statistical data and use them to solve unique analytical problems.
}
\usage{
rym_get_logs(counter = NULL, date.from = Sys.Date() - 10, 
date.to = Sys.Date() - 1, fields = "ym:s:date,ym:s:counterID,
ym:s:dateTime,ym:s:isNewUser,ym:s:startURL,
ym:s:visitDuration,ym:s:ipAddress,ym:s:referer", 
source = "visits", login = NULL, token.path = getwd())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{counter}{
Yandex metrika counter id
}
  \item{date.from}{
Start date in format YYYY-MM-DD
}
  \item{date.to}{
End date in format YYYY-MM-DD
}
  \item{fields}{
List of fields
}
  \item{source}{
Log source, one of "hits" or "visits"
}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\value{
Data frame with values and fields
}
\references{
Visits fields - https://tech.yandex.ru/metrika/doc/api2/logs/fields/visits-docpage/
Hits fields - https://tech.yandex.ru/metrika/doc/api2/logs/fields/hits-docpage/
Logs API docs - https://tech.yandex.ru/metrika/doc/api2/logs/intro-docpage/
}
\author{
Alexey Seleznev
}
\seealso{
For load statics you also can use \code{\link{rym:rym_get_data}{rym_get_data()}} and \code{\link{rym:rym_get_ga}{rym_get_ga()}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (counter = NULL, date.from = Sys.Date() - 10, date.to = Sys.Date() - 
    1, fields = "ym:s:date,ym:s:counterID,ym:s:dateTime,ym:s:isNewUser,ym:s:startURL,ym:s:visitDuration,ym:s:ipAddress,ym:s:referer", 
    source = "visits", login = NULL, token.path = getwd()) 
{
    fun_start <- Sys.time()
    token <- rym_auth(login = login, token.path = token.path)$access_token
    fields <- gsub("[\\s\\n\\t]", "", fields, perl = TRUE)
    logapi <- POST(paste0("https://api-metrika.yandex.ru/management/v1/counter/", 
        counter, "/logrequests?date1=", date.from, "&date2=", 
        date.to, "&fields=", fields, "&source=", source, "&oauth_token=", 
        token))
    queryparam <- content(logapi, "parsed", "application/json")
    if (!is.null(queryparam$errors)) {
        stop(paste0(queryparam$errors[[1]][[1]], " - ", queryparam$errors[[1]][[2]], 
            ", error code - ", queryparam$code))
    }
    request_id <- queryparam$log_request$request_id
    request_status <- queryparam$log_request$status
    start_time <- Sys.time()
    Sys.sleep(7)
    packageStartupMessage("Processing ", appendLF = FALSE)
    while (request_status != "processed") {
        logapistatus <- GET(paste0("https://api-metrika.yandex.ru/management/v1/counter/", 
            counter, "/logrequest/", request_id, "?oauth_token=", 
            token))
        request_status <- content(logapistatus, "parsed", "application/json")$log_request$status
        packageStartupMessage(".", appendLF = FALSE)
        partsnun <- length(content(logapistatus, "parsed", "application/json")$log_request$parts)
        if (request_status == "processed") {
            packageStartupMessage(paste0(" processing time ", 
                round(Sys.time() - start_time, 2), " sec"), appendLF = TRUE)
            result <- data.frame()
            packageStartupMessage("Loading ", appendLF = FALSE)
            start_load_time <- Sys.time()
            for (parts in 0:partsnun - 1) {
                packageStartupMessage(".", appendLF = FALSE)
                logapidata <- GET(paste0("https://api-metrika.yandex.ru/management/v1/counter/", 
                  counter, "/logrequest/", request_id, "/part/", 
                  parts, "/download?oauth_token=", token))
                rawdata <- try(content(logapidata, "text", "application/json", 
                  encoding = "UTF-8"), silent = T)
                df_temp <- try(read.delim(text = rawdata), silent = T)
                result <- rbind(result, df_temp)
            }
            packageStartupMessage(paste0(" done! ", "loading time ", 
                round(Sys.time() - start_load_time, 2), " sec"))
            req_delite <- POST(paste0("https://api-metrika.yandex.ru/management/v1/counter/", 
                counter, "/logrequest/", request_id, "/clean?oauth_token=", 
                token))
            req_delite <- content(req_delite, "parsed", "application/json")
            packageStartupMessage("Information: ")
            packageStartupMessage(paste0("Request id: ", request_id))
            packageStartupMessage(paste0("Request status: ", 
                req_delite$log_request$status))
            packageStartupMessage(paste0("Total time: ", round(Sys.time() - 
                fun_start, 2), " sec"))
            packageStartupMessage(paste0("Data size: ", round(req_delite$log_request$size * 
                1e-06, 2), " Mb"))
            packageStartupMessage(paste0("Return rows: ", nrow(result)))
            if (exists("result")) {
                packageStartupMessage("Data load successful!")
            }
            return(result)
        }
        if (request_status == "processing_failed") {
            stop("\316\370\350\341\352\340 \357\360\350 \356\341\360\340\341\356\362\352\345 \347\340\357\360\356\361\340")
        }
        if (request_status == "canceled") {
            stop("\307\340\357\360\356\361 \341\373\353 \356\362\354\345\355\270\355")
        }
        if (request_status == "cleaned_by_user" | request_status == 
            "cleaned_automatically_as_too_old") {
            stop("\307\340\357\360\356\361 \341\373\353 \363\344\340\353\270\355 \361 \361\345\360\342\345\360\340")
        }
        Sys.sleep(5)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
