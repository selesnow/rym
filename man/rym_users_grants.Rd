\name{rym_users_grants}
\alias{rym_users_grants}

\title{
List of users permissions
}
\description{
Returns information about the permissions to manage the counter and viewing statistics from 'management API'.
}
\usage{
rym_users_grants(counter, login = NULL, token.path = getwd())
}

\arguments{
  \item{counter}{
Yandex Metrika counter ID, you can get ids of all your conters over rym_counters
}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential, by default is your work directory}
}
\value{
Data frame with list of yandex metrika counter users
	\item{user_login}{Login of the user who has been given permission to manage the counter.}
	\item{perm}{Access level, one of view, edit, public_stat.}
	\item{created_at}{Date of granting access in the format YYYY-MM-DD'T'hh: mm: ssZ.}
	\item{comment}{An arbitrary comment. The number of characters can not exceed 255.}
	\item{partner_data_access}{Logical, is partner access or not.}
}
\references{
\href{https://tech.yandex.ru/metrika/doc/api2/management/grants/grants-docpage/}{Official docs}

Run \code{vignette("rym-management-api", package = "rym")} to see the corresponding vignette.
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
users <- rym_users_grants(counter    = "your_counter_id",
                          login      = "your_login")
}
}
