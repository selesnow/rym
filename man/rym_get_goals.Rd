\name{rym_get_goals}
\alias{rym_get_goals}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
List of goals
}
\description{
Returns information about the purpose of the yandex metrica counter.
}
\usage{
rym_get_goals(counter, login = NULL, token.path = getwd())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{counter}{
Yandex Metrika counter ID
}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\value{
Data frame with list of yandex metrica counters
}
\references{
\href{https://tech.yandex.ru/metrika/doc/api2/management/goals/goals-docpage/}{Official docs of Yandex Metrica Management API}
\href{https://selesnow.github.io/rym/#%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0-%D1%81-api-%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F}{Docs on rym website}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
my_counters <- rym_get_goals(login = "my_login")
}
}