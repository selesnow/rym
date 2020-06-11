\name{rym-expense-uploading}
\alias{rym-expense-uploading}
\alias{rym_upload_expense}
\alias{rym_delete_uploaded_expense}
\alias{rym_get_uploadings_expense}
\title{
Manage Cost Data Upload
}
\description{
Upload, delete and get list of uploading expense data in 'Yandex Metrica'.
}
\usage{
rym_upload_expense(
    counter, 
    data,
    comment    = paste0("Upload bt rym at ", Sys.time()),
    login      = getOption("rym.user"), 
    token.path = getOption("rym.token_path"))

rym_delete_uploaded_expense(
    counter, 
    data,
    comment    = paste0("Upload bt rym at ", Sys.time()),
    login      = getOption("rym.user"), 
    token.path = getOption("rym.token_path"))
    
rym_get_uploadings_expense(
    counter, 
    login      = getOption("rym.user"), 
    token.path = getOption("rym.token_path"))

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{counter}{Your yandex metrica counter}
  \item{data}{data.frame, expense data for loading}
  \item{comment}{Comment for data loading}
  \item{login}{character, Your Yandex login}
  \item{token.path}{character, Directory for store API credential}
}
\details{
Loading data format.

Require:
\describe{
  \item{Date}{Date in YYYY-MM-DD format}
  \item{UTMSource}{Source name, for example google}
  \item{Expenses}{Expense size, for example 12.34}
}

Optional:
\describe{
  \item{UTMMedium}{Medium name, for exmaple cpc}
  \item{UTMCampaign}{Campaign name, for example my campaing}
  \item{UTMTerm}{Term name, for example my term}
  \item{UTMContent}{Content name, for example my contant}
  \item{Currency}{Currency in \href{https://www.iso.org/iso-4217-currency-codes.html}{ISO 4217} code}
  \item{Clicks}{Clicks number, for example 23}
}
}
\references{
See official dox:
\href{https://yandex.ru/dev/metrika/doc/api2/management/expenses/uploadbody-docpage/}{API documents}
\href{https://yandex.ru/support/metrica/ad/expenses.html#expences}{Yandex Metrica documents}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
# prepare data for loading
expense <- data.frame(Date        = c("2020-06-01",
                                      "2020-06-02"),
                      UTMSource   = c("test_s_1",
                                      "test_s_2"),
                      Expenses    = c(88.12,
                                      92.11),
                      UTMMedium   = c("cpc",
                                      "cpm"),
                      UTMCampaign = c("camp1",
                                      "camp2"),
                      UTMTerm     = c("term1",
                                      "term2"),
                      UTMContent  = c("cont1",
                                      "cont2"),
                      Currency    = c("RUB", 
                                      "RUB"),
                      Clicks      = c(11, 15))

# upload data
rym_upload_expense(
                counter = 1111111, 
                data    = expense,
                login   = 'yandex_login')

# delete data
rym_delete_uploaded_expense(
                counter = 1111111, 
                data    = expense,
                login   = 'yandex_login')

# get list of expense uploadings
loaded <- rym_get_uploadings_expense(
                counter = 1111111, 
                login   = 'yandex_login')

}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
