\name{rym-calls}
\alias{rym-calls}
\alias{rym_upload_calls}
\alias{rym_enable_calls}
\alias{rym_disable_calls}
\alias{rym_allow_calls}
\alias{rym_get_uploadings_calls}
\title{
Manage callss
}
\description{
calls Management:
\describe{
  \item{rym_enable_calls}{Enable calls tracking for the specified counter.}
  \item{rym_disable_calls}{Disable calls tracking for the specified counter.}
  \item{rym_upload_calls}{Upload callss.}
  \item{rym_allow_calls}{Returns the date and time from which conversions can be linked to visits for the specified counter.}
  \item{rym_get_uploadings_callss}{Returns a list of calls downloads.}
}
}
\usage{
rym_enable_calls(
   counter, 
   login      = getOption("rym.user"), 
   token.path = getOption("rym.token_path"))
           
rym_disable_calls(
   counter, 
   login      = getOption("rym.user"), 
   token.path = getOption("rym.token_path"))
   
rym_allow_calls(
   counter, 
   login      = getOption("rym.user"), 
   token.path = getOption("rym.token_path"))
   
rym_upload_calls(
   counter, 
   data,
   client.id.type = c("CLIENT_ID", "USER_ID"),
   new.goal.name  = NULL,
   comment        = paste0("Upload by rym at ", Sys.time()),
   login          = getOption("rym.user"), 
   token.path     = getOption("rym.token_path"))

rym_get_uploadings_calls(
   counter, 
   login      = getOption("rym.user"), 
   token.path = getOption("rym.token_path"))
}

\arguments{
  \item{counter}{Your yandex metrica counter}
  \item{data}{data.frame, expense data for loading}
  \item{client.id.type}{Type of visitor identifiers: CLIENT_ID or USER_ID}
  \item{comment}{Comment for data loading}
  \item{new.goal.name}{The name of the new goal for calls in the event that such a goal does not exist. If the target exists, this parameter is ignored}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\details{
Loading data format.

Require:
\describe{
  \item{UserId, ClientId, Yclid}{Identifier of the visitor to the site or advertising campaign in Yandex.Direct, for example: 12345}
}

Optional:
\describe{
  \item{StaticCall}{whether the call is static (1 - static, 0 - dynamic)}
  \item{Price}{target price, the decimal separator is the dot (.)}
  \item{Currency}{currency in the three-letter format ISO 4217, for example: RUB}
  \item{PhoneNumber}{phone number without spaces (with country and city code). For example, +70123456789}
  \item{TalkDuration}{call duration in seconds}
  \item{HoldDuration}{call waiting time in seconds}
  \item{CallMissed}{whether the call is missed (1 - missed, 0 - answered)}
  \item{Tag}{custom label. It can be used to mark the quality of a call or its outcome, etc. For example, “the customer was not satisfied with the price”}
  \item{FirstTimeCaller}{primary (1 - primary call, 0 - secondary call)}
  \item{URL}{The URL from which the call came (the page associated with the event). For example, this could be the landing page for an ad campaign that has a phone number (PhoneNumber)}
  \item{CallTrackerURL}{The URL to go to the call tracker interface}
}

Example of \href{https://download.cdn.yandex.net/from/yandex.ru/support/ru/metrica/files/offline-conversions.csv}{CSV file}.
}
\references{
See official dox:
\href{https://yandex.ru/dev/metrika/doc/api2/practice/calls-docpage/}{API documents}
\href{https://yandex.ru/dev/metrika/doc/api2/management/offline_conversion/uploadcalls-docpage/}{Upload calls info into Yandex Metrica}
\href{https://yandex.ru/support/metrica/data/calls.html}{Calls in Yandex Metrica}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
# read data for upload
data <- read.csv("https://bit.ly/2CcsNyl")

# enable offline cnversion
rym_enable_calls(
   counter = 123456789, 
   login   = "your_login"
)

# upload data
rym_upload_calls(
   counter        = 123456789, 
   data           = data,
   client.id.type = "CLIENT_ID",
   login          = "your_login")
   
# check uploading
rym_allow_calls(
   counter = 123456789, 
   login   = "your_login")
}
}