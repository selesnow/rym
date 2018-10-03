\name{rym_get_segments}
\alias{rym_get_segments}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List of segments
}
\description{
Returns a list of segments created using the API and related to the specified counter.
}
\usage{
rym_get_segments(counter, login = NULL, token.path = getwd())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{counter}{
Yandex Metrika counter ID, you can get ids of all your conters over rym_counters
}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential, by default is your work directory}
}
\value{
Data frame with list of yandex metrica counter segments
	\item{id}{Segment id.}
	\item{counter_id}{Yandex Metrica counter id.}
	\item{name}{Segment name.}
	\item{expression}{An expression that matches the value of the filters parameter.}
	\item{is_retargeting}{Logical, is retargeting segment or not.}
	\item{segment_source}{Source of the segment. Indicates how to create it. Accepts the value of api - segments that are created using the API are used.}
}
\references{
\href{https://tech.yandex.ru/metrika/doc/api2/management/segments/getsegmentsforcounter-docpage/}{Official docs of Yandex Metrica Management API}
\href{https://selesnow.github.io/rym/#%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-api-%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F}{Docs on rym website}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
segments <- rym_get_segments(counter    = "your_counter_id",
                             login      = "your_login")
}
}