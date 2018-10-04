\name{rym_get_ga}
\alias{rym_get_ga}
\title{
Work with compatible with the Google Analytics Core Reporting API (v3)
}
\description{
Allows you to perform the following operations:
1. Obtain information about site traffic and other data.
2. Integrate Yandex.Metrica data with applications developed with the Google Analytics Core Reporting API (v3) in mind.
3. Use the usual query parameters when collecting statistics, if you previously worked with the Google Analytics Core Reporting API (v3).
}
\usage{
rym_get_ga(start.date = "10daysAgo", end.date = "today", 
  counter = NULL, dimensions = "ga:date,ga:sourceMedium", 
  metrics = "ga:sessions,ga:bounces,ga:users", 
  filters = NULL, sort = NULL, 
  sampling.level = "HIGHER_PRECISION", 
  login = NULL, token.path = getwd())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{start.date}{
Start date in format YYYY-MM-DD
}
  \item{end.date}{
End date in format YYYY-MM-DD
}
  \item{counter}{
Your yandex metrica counter
}
  \item{dimensions}{
List of dimensions fields, for example "ga:browser,ga:city", see \href{https://tech.yandex.ru/metrika/doc/api2/ga/ga/implemented/metrika_dim-docpage/}{dictionary of available dimension}
}
  \item{metrics}{
List of metrics fields, for example "ga:users,ga:sessions", see \href{https://tech.yandex.ru/metrika/doc/api2/ga/ga/implemented/metrika_dim-docpage/}{dictionary of available metrics}
}
  \item{filters}{
List of filtrind dimensions and metrics.
}
  \item{sort}{
Sorting fields
}
  \item{sampling.level}{
One of "HIGHER_PRECISION", "FASTER", "DEFAULT"
}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\details{
Limits:
10 metrics for one query.
7 dimensions for one query
}
\value{
Data frame with fields.
}
\references{
\href{https://tech.yandex.ru/metrika/doc/api2/ga/intro-docpage/}{Official ompatible with the Google Analytics Core Reporting API (v3) docs}

Run \code{vignette("rym-ga-api", package = "rym")} to see the corresponding vignette.
}
\author{
Alexey Seleznev
}

\seealso{
For load statics you also can use \code{\link[rym:rym_get_data]{rym_get_data()}} and \code{\link[rym:rym_get_logs]{rym_get_logs()}}
}
\examples{
\dontrun{
data <- rym_get_ga(start.date = "2017-08-01",
                   end.date = "yesterday",
                   counter = "ga:26841129",
                   metrics = "ga:sessions,ga:bounces,ga:users",
                   dimensions = "ga:date,ga:sourceMedium", 
                   login      = "my_login")
}
}

