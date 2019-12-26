\name{rym_get_filters}
\alias{rym_get_filters}

\title{
List of filters
}
\description{
Returns information about counter filters.
}
\usage{
rym_get_filters(counter, login = getOption("rym.user"), 
                token.path = getOption("rym.token_path"))
}

\arguments{
  \item{counter}{
Yandex Metrika counter ID, you can get ids of all your conters over rym_counters
}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential, by default is your work directory}
}
\value{
Data frame with list of yandex metrika counter filters
	\item{id}{Filter id.}
	\item{attr}{The type of data to which the filter applies. One of referer, uniq_id, client_ip, title, url.}
	\item{type}{The relation or action for the filter, equal, contain, me, start, interval, only_mirrors.}
	\item{value}{Filter value.}
	\item{action}{Type of filter, include or exclude.}
	\item{status}{Status of filter, active or disabled.}
	\item{with_subdomains}{Filter by subdomains.}
	\item{start_ip}{The first IP address of the range.}
	\item{start_ip}{The last IP address of the range.}
}
\references{
\href{https://tech.yandex.ru/metrika/doc/api2/management/filters/filters-docpage/}{Official docs}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
filters <- rym_get_filters(counter    = "your_counter_id",
                           login      = "your_login")
}
}
