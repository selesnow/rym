\name{rym_add_goal}
\alias{rym_add_goal}
\title{
Create goal in 'Yandex Metrica'
}
\description{
Create new goal in 'Yandex Metrica' counter.
}
\usage{
rym_add_goal(
    counter, 
    name,
    type = c("number","action","step","url"),
    is.retargeting = FALSE,
    flag = c(NA, "basket", "order"),
    conditions = NULL,
    login = getOption("rym.user"), 
    token.path = getOption("rym.token_path"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{counter}{Yandex Metrika counter ID}
  \item{name}{character, goal name}
  \item{type}{character, goal type, one of "number","action","step","url"}
  \item{is.retargeting}{boolean, if TRUE the goal is retargeting}
  \item{flag}{character, target type for Yandex.Market customers}
  \item{conditions}{list, the list of conditions, for example \code{list(type = 'exact', url = 'rym-first-goal')}}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\references{
\href{https://yandex.ru/dev/metrika/doc/api2/management/goals/addgoal-docpage/}{Official docs of 'Yandex Metrica Management API'}
}
\author{
Alexey Seleznev
}
\examples{
\dontrun{
rym_add_goal(123456789, 
             name = 'first_goal',
             type = 'action',
             conditions = list(type = 'exact', 
                               url = 'rym-first-goal'),
             login = 'your_login')
}
}