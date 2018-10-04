\name{rym_get_data}
\alias{rym_get_data}
\title{
Load data by compatible with the Google Analytics Core Reporting API
}
\description{
The Reporting API allows you to obtain information about site visits statistics and other data without using the Yandex.Metrica interface.
}
\usage{
rym_get_data(direct.client.logins = NULL, counters, 
  metrics = "ym:s:visits,ym:s:pageviews,ym:s:users", 
  dimensions = NULL, filters = NULL, 
  sort = NULL, date.from = "8daysAgo", 
  date.to = "yesterday", accuracy = "full", 
  include_undefined = TRUE, lang = "ru", 
  timezone = NULL, pretty = FALSE, 
  login = NULL, token.path = getwd())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{direct.client.logins}{
Logins of Yandex.Direct clients, separated by commas. Can be used to generate a Direct Expense report.
}
  \item{counters}{
Counter identifiers, separated by commas.
}
  \item{metrics}{
A list of metrics, separated by a comma.
}
  \item{dimensions}{
A list of groupings, separated by a comma.
}
  \item{filters}{
A list of filtring data.
}
  \item{sort}{
A list of metrics and dimension for sorting result data, for desc sorting use -.
}
  \item{date.from}{
Start date in YYYY-MM-DD.
}
  \item{date.to}{
End date in YYYY-MM-DD.
}
  \item{accuracy}{
Sampling level, one of low, medium, high or full. Or numeric from 0 to 1, where 1 - no sampling.
}
  \item{include_undefined}{
Includes in response rows for which grouping values are not defined.
}
  \item{lang}{
Language, by default ru
}
  \item{timezone}{
Timezone for time data.
}
  \item{pretty}{
Specifies the formatting of the result.
}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\details{
This API have some limits.
1. 10 demensions in the query.
2. 20 metrics in one query.
3. Limit: the number of unique groupings and metrics is up to 10, the number of individual filters is up to 20, the length of the line in the filter is up to 10,000 characters.
}
\value{
Data frame with dimension and metrics.
}
\references{
\href{https://tech.yandex.ru/metrika/doc/api2/api_v1/intro-docpage/}{Reporting API docs}

Run \code{vignette("rym-reporting-api", package = "rym")} to see the corresponding vignette.
}
\author{
Alexey Seleznev
}
\seealso{
For load statics you also can use \code{\link[rym:rym_get_ga]{rym_get_ga}} and \code{\link[rym:rym_get_logs]{rym_get_logs}}	
}
	
\examples{
\dontrun{
test_data <- rym_get_data(counters = 26841129,
                          dimensions = "ym:s:date,
                                        ym:s:lastsignTrafficSource", 
						  login = "my_login", 
						  sort = "ym:s:date")
}
}
