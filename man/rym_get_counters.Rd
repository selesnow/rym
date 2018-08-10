\name{rym_get_counters}
\alias{rym_get_counters}
\title{Load Yandex Metrica counters}
\description{
Returns a list of existing counters available to the user.
}
\usage{
rym_get_counters(login = NULL, token.path = getwd())
}
\arguments{
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
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
my_counters <- rym_get_counters(lofin = "my_login")
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
