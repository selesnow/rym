\name{rym_add_segment}
\alias{rym_add_segment}
\title{
Create segment in 'Yandex Metrica'
}
\description{
Create a new API segment in 'Yandex Metrica' counter.
}
\usage{
rym_add_segment(
     counter, 
     name,
     expression,
     login = getOption("rym.user"), 
     token.path = getOption("rym.token_path"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{counter}{Yandex Metrika counter ID}
  \item{name}{character, segment name}
  \item{expression}{character, filter expression, for example \code{"ym:s:trafficSource=='organic' AND ym:s:isNewUser=='Yes'"}, for more information go \href{https://yandex.ru/dev/metrika/doc/api2/api_v1/segmentation-docpage/}{link}}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\references{
\href{https://yandex.ru/dev/metrika/doc/api2/management/segments/createsegment-docpage/}{Official docs of 'Yandex Metrica Management API'}
}
\author{
Alexey Seleznev
}
\seealso{
See \code{\link[rym:rym_add_goal]{rym_add_goal()}} for create new goal in 'Yandex Metrica'.
}
\examples{
\dontrun{
rym_add_segment(
     counter = 123456789, 
     name = "my_segment",
     expression = "ym:s:trafficSource=='organic' AND ym:s:isNewUser=='Yes'",
     login = "your_login")

}
}


