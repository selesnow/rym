\name{rym_get_counters}
\alias{rym_get_counters}
\title{Load Yandex Metrica counters}
\description{
Returns a list of existing counters available to the user.
}
\usage{
rym_get_counters(login = NULL, token.path = getwd(),
                 search.string = NULL)
}
\arguments{
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
  \item{search.string}{character, Filter by line. Counters will be displayed, the identifier, name, site or mirrors of which contain the specified substring}
}
\value{
Data frame with list of yandex metrica counters.
}
\references{
Official docs - https://tech.yandex.ru/metrika/doc/api2/management/counters/counters-docpage/
}
\author{
Alexey Seleznev
}
\examples{
\dontrun{
my_counters <- rym_get_counters(login = "my_login")
}
}

