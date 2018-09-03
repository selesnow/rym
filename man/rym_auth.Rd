\name{rym_auth}
\alias{rym_auth}
\title{
Authentication in Yandex Metrika API
}
\description{
Actually you don`t need call rym_auth since it will be called when you run any of the functions available in rym.
}
\usage{
rym_auth(login = NULL, new.user = FALSE, 
	token.path = getwd(), save.credential = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{login}{character, Your Yandex login}
  \item{new.user}{logical, If TRUE you reauth in Yandex Metrika API}
  \item{token.path}{character, Directory for store API credential}
  \item{save.credential}{logical, If TRUE your credential save in local file login.rymAuth.RData, default TRUE}
}
\details{
All your credential save in directory specified in the argument token.path, after save every time you run any function from rym, rym_auth be load credentials from local file login.rymAuth.RData.
rym_auth create files for each your logins, which makes it possible use many yandex account in one script.
Every tokens expire after 1 year after authentication, but rym_auth automaticly refresh and save you credential 30 days before he expire.
}
\value{
List with credential data.
}
\references{
OAuth 2.0 in Yandex docs - https://tech.yandex.ru/oauth/doc/dg/concepts/about-docpage/
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
library(rym)
rym_auth(login = "my_login", token.path = tempdir(),
save.credential = TRUE)
}
}
