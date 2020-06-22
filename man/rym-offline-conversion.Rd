\name{rym-offline-conversion}
\alias{rym-offline-conversion}
\alias{rym_upload_offline_conversion}
\alias{rym_enable_offline_conversion}
\alias{rym_disable_offline_conversion}
\alias{rym_allow_offline_conversion}
\alias{rym_get_uploadings_offline_conversions}
\title{
Manage offline conversions
}
\description{
Offline Conversion Management:
\describe{
  \item{rym_enable_offline_conversion}{Enable offline conversion tracking for the specified counter.}
  \item{rym_disable_offline_conversion}{Disable offline conversion tracking for the specified counter.}
  \item{rym_upload_offline_conversion}{Upload offline conversions.}
  \item{rym_allow_offline_conversion}{Returns the date and time from which conversions can be linked to visits for the specified counter.}
  \item{rym_get_uploadings_offline_conversions}{Returns a list of offline conversion downloads.}
}
}
\usage{
rym_enable_offline_conversion(
   counter, 
   login      = getOption("rym.user"), 
   token.path = getOption("rym.token_path"))
           
rym_disable_offline_conversion(
   counter, 
   login      = getOption("rym.user"), 
   token.path = getOption("rym.token_path"))
   
rym_allow_offline_conversion(
   counter, 
   login      = getOption("rym.user"), 
   token.path = getOption("rym.token_path"))
   
rym_upload_offline_conversion(
   counter, 
   data,
   client.id.type = c("CLIENT_ID", "USER_ID"),
   comment        = paste0("Upload by rym at ", Sys.time()),
   login          = getOption("rym.user"), 
   token.path     = getOption("rym.token_path"))

rym_get_uploadings_offline_conversions(
   counter, 
   login      = getOption("rym.user"), 
   token.path = getOption("rym.token_path"))
}

\arguments{
  \item{counter}{Your yandex metrica counter}
  \item{data}{data.frame, expense data for loading}
  \item{client.id.type}{Type of visitor identifiers: CLIENT_ID or USER_ID}
  \item{comment}{Comment for data loading}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\details{
Loading data format.

Require:
\describe{
  \item{UserId, ClientId, Yclid}{Identifier of the visitor to the site or advertising campaign in Yandex.Direct, for example: 12345}
  \item{Target}{Target ID specified when creating the target, for example order_confirmed}
  \item{DateTime}{The time at which the conversion occurred in Unix Time Stamp format. Indicate the time in the time zone UTC + 0, for example: 1481718166}
}

Optional:
\describe{
  \item{Price}{Goal Value, for example: 1000}
  \item{Currency}{Three-letter currency code according to ISO 4217, for example: RUB}
}

Example of \href{https://download.cdn.yandex.net/from/yandex.ru/support/ru/metrica/files/offline-conversions.csv}{CSV file}.
}
\references{
See official dox:
\href{https://yandex.ru/dev/metrika/doc/api2/practice/conversion-docpage/#offline}{API documents}
\href{https://yandex.ru/support/metrica/data/offline-conversion_data.html}{Yandex Metrica documents}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
# read data for upload
data <- read.csv("https://bit.ly/2CcsNyl")

# enable offline cnversion
rym_enable_offline_conversion(
   counter = 123456789, 
   login   = "your_login"
)

# upload data
rym_upload_offline_conversion(
   counter        = 123456789, 
   data           = data,
   client.id.type = "CLIENT_ID",
   login          = "your_login")
   
# check uploading
rym_allow_offline_conversion(
   counter = 123456789, 
   login   = "your_login")
}
}