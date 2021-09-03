\name{rym-package}
\alias{rym-package}
\alias{rym}
\docType{package}
\title{
\packageTitle{rym}
}
\description{
\packageDescription{rym}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{rym}
\packageIndices{rym}
}
\author{
\packageAuthor{rym}

Maintainer: \packageMaintainer{rym}
}
\references{
\href{https://selesnow.github.io/rym/}{Officialrym documents}

\href{https://yandex.ru/dev/metrika/doc/api2/management/intro-docpage}{Management API Documents}

\href{https://yandex.ru/dev/metrika/doc/api2/api_v1/intro-docpage}{Reporting API Documents}

\href{https://yandex.ru/dev/metrika/doc/api2/ga/intro-docpage}{API Compatible with Google Analytics Core API v3}

\href{https://yandex.ru/dev/metrika/doc/api2/logs/intro-docpage}{Logs API Documentations}

Or read vignettes:

\code{vignette("intro-to-rym", package = "rym")}

\code{vignette("rym-management-api", package = "rym")}

\code{vignette("rym-reporting-api", package = "rym")}

\code{vignette("rym-ga-api", package = "rym")}

\code{vignette("rym-logs-api", package = "rym")}
}
\examples{
\dontrun{
library(rym)

# get counters list
my_counters <- rym_get_counter()

# join all counters id in string format, like 1,2,3,4,5,...,n
counters_ids <- paste0(my_counters$id, collapse = ",")

# get statistic from reporting API
reporting <- rym_get_data(counters   = counters_ids,
                          date.from  = "2018-08-01",
                          date.to    = "yesterday",
                          dimensions = "ym:s:date,
				                        ym:s:lastTrafficSource",
                          metrics    = "ym:s:visits,
						                ym:s:pageviews,
						                ym:s:users",
                          sort       = "-ym:s:date")
						  
# get raw data
raw_data <- rym_get_logs(counter = counters_ids[1],
                              date.from = "2016-12-01",
                              date.to = "2016-12-20",
                              fields = "ym:s:visitID,
							            ym:s:date,
										ym:s:bounce,
										ym:s:clientID,
										ym:s:networkType",
                              source = "visits")
}
}
