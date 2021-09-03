\name{rym_get_goals}
\alias{rym_get_goals}

\title{
List of goals
}
\description{
Returns information about the purpose of the yandex metrica counter.
}
\usage{
rym_get_goals(counter, login = getOption("rym.user"), 
          token.path = getOption("rym.token_path"))
}

\arguments{
  \item{counter}{Yandex Metrika counter ID}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\value{
Data frame with list of yandex metrica counters
}
\references{
\href{https://yandex.ru/dev/metrika/doc/api2/management/goals/goals-docpage}{Official docs of 'Yandex Metrica Management API'}

\href{https://selesnow.github.io/rym/}{Docs on rym website}

Run \code{vignette("rym-management-api", package = "rym")} to see the corresponding vignette.
}
\author{
Alexey Seleznev
}
\examples{
\dontrun{
my_counters <- rym_get_goals(login = "my_login")
}
}
