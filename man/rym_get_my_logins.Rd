\name{rym_get_my_logins}
\alias{rym_get_my_logins}
\title{
Show list of auth logins
}
\description{
Get login list, chose and set default yandex login in current R session.
}
\usage{
rym_get_my_logins(token.path = getOption("rym.token_path"), 
                  set.login = TRUE)
}
\arguments{
  \item{token.path}{character, Directory for store API credential}
  \item{set.login}{logical, if TRUE you set one of your account as session default}
}
\author{
Alexey Seleznev
}	
\examples{
\dontrun{
rym_get_my_logins()
}
}
