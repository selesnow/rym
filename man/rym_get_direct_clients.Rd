\name{rym_get_direct_clients}
\alias{rym_get_direct_clients}
\title{
Load Yandex.Direct clients
}
\description{
Returns data about Yandex.Direct clients for campaigns that the owner of the Metrics counter has access to.
}
\usage{
rym_get_direct_clients(counters, login = NULL, token.path = getwd())
}
\arguments{
  \item{counters}{Counter identifiers, separated by commas}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\value{
Data frame with Yandex Direct clients.
}
\references{
\href{https://tech.yandex.ru/metrika/doc/api2/management/direct_clients/getclients-docpage/}{Reporting API docs}
}
\author{
Alexey Seleznev
}	
\examples{
\dontrun{
my_clients <- rym_get_direct_clients(counters="11111,22222",
                                     login = "my_login")
}
}
