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
~~ An overview of how to use the package, including the most important functions ~~
}
\author{
\packageAuthor{rym}

Maintainer: \packageMaintainer{rym}
}
\references{
\href{https://selesnow.github.io/rym}{Officialrym documents}

\href{https://tech.yandex.ru/metrika/doc/api2/management/intro-docpage/}{Manegment API Documents}

\href{https://tech.yandex.ru/metrika/doc/api2/api_v1/intro-docpage/}{Reporting API Documents}

\href{https://tech.yandex.ru/metrika/doc/api2/ga/intro-docpage/}{API Сompatible with Google Analytics Core API v3}

\href{https://tech.yandex.ru/metrika/doc/api2/logs/intro-docpage/}{Logs API Documentations}
}
\examples{
\dontrun{
library(rym)

# get counters list
my_counters <- rym_get_counter()

# join all counters id in string format, like 1,2,3,4,5,...,n
counters_ids <- paste0(my_counters$id, collapse = ",")

# get statistic by reporting API
reporting.api.stat <- rym_get_data(counters   = counters_ids,
                                   date.from  = "2018-08-01",
                                   date.to    = "yesterday",
                                   dimensions = "ym:s:date,ym:s:lastTrafficSource",
                                   metrics    = "ym:s:visits,ym:s:pageviews,ym:s:users",
                                   sort       = "-ym:s:date")
}
}
