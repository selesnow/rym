\name{rym_get_logs}
\alias{rym_get_logs}
\title{
Get raw data from yandex metrika.
}
\description{
	'Logs API' allows you to receive non-aggregated data collected by Yandex.Metrica. 
	This API is intended for service users who want to independently process 
	statistical data and use them to solve unique analytical problems.
}
\usage{
rym_get_logs(counter = NULL, date.from = Sys.Date() - 10, date.to =
    Sys.Date() - 1, fields =
    "ym:s:date,ym:s:counterID,ym:s:dateTime,
	ym:s:isNewUser,ym:s:startURL,ym:s:visitDuration,
	ym:s:ipAddress,ym:s:referer",
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
\href{https://tech.yandex.ru/metrika/doc/api2/logs/fields/visits-docpage/}{Visits fields}
	
\href{https://tech.yandex.ru/metrika/doc/api2/logs/fields/hits-docpage/}{Hits fields}
	
\href{https://tech.yandex.ru/metrika/doc/api2/logs/intro-docpage/}{Logs API docs}

\href{https://selesnow.github.io/rym/}{Docs on rym website}

Run \code{vignette("rym-logs-api", package = "rym")} to see the corresponding vignette.
	
}
\author{
Alexey Seleznev
}
\seealso{
	
For load statics you also can use \code{\link[rym:rym_get_data]{rym_get_data()}} and \code{\link[rym:rym_get_ga]{rym_get_ga()}}
}
\examples{
\dontrun{
# where "00000000" is your counter id
rawmetrikdata <- rym_get_logs(counter = "00000000",
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
