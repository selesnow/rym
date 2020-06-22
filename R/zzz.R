.onAttach <- function(lib, pkg, ...) {
  packageStartupMessage(rymWelcomeMessage())

  packageStartupMessage("rym presets:")

  ## token path
  packageStartupMessage("...Set rym token_path: ", appendLF = F)
  if (Sys.getenv("RYM_TOKEN_PATH") != "") {
    packageStartupMessage("success")
  } else {
    packageStartupMessage("none")
  }

  ## username
  packageStartupMessage("...Set rym username: ", appendLF = F)
  if (Sys.getenv("RYM_USER") != "") {
    packageStartupMessage("success")
  } else {
    packageStartupMessage("none")
  }
}

#
#

rymWelcomeMessage <- function() {
  # library(utils)

  paste0(
    "\n",
    "---------------------\n",
    "Welcome to rym version ", utils::packageDescription("rym")$Version, " - R Interface to Yandex.Metrica API.\n",
    "\n",
    " Author:          Alexey Seleznev (Head of analytics dept at Netpeak).\n",
    "Telegram channel: https://t.me/R4marketing \n",
    "YouTube channel:  https://www.youtube.com/R4marketing/?sub_confirmation=1 \n",
    " Email:           selesnow@gmail.com\n",
    " Blog:            https://alexeyseleznev.wordpress.com \n",
    " Facebook:        https://facebook.com/selesnown \n",
    " Linkedin:        https://www.linkedin.com/in/selesnow \n",
    " Package Site:    https://selesnow.github.io \n",
    " Rdocumentation:  https://www.rdocumentation.org/collaborators/name/Alexey%20Seleznev \n",
    "\n",
    "Support:\n",
    " Package website: https://selesnow.github.io/rym",
    " Type help(package = 'rym') for the main documentation.\n",
    " The github page is: https://github.com/selesnow/rym/\n",
    "\n",
    "Vignettes:\n",
    " vignette('intro-to-rym', package = 'rym')\n",
    " vignette('rym-management-api', package = 'rym')\n",
    " vignette('rym-reporting-api', package = 'rym')\n",
    " vignette('rym-ga-api', package = 'rym')\n",
    " vignette('rym-logs-api', package = 'rym')\n",
    " vignette('rym-load-expense', package = 'rym')\n",
    " vignette('rym-load-offline-conversion', package = 'rym')\n",
    " vignette('rym-calls', package = 'rym')\n",
    "\n",
    "Suggestions and bug-reports can be submitted at: https://github.com/selesnow/rym/issues\n",
    "Or contact: <selesnow@gmail.com>\n",
    "\n",
    "\tTo suppress this message use:  ", "suppressPackageStartupMessages(library(rym))\n",
    "---------------------\n"
  )
}


.onLoad <- function(libname, pkgname) {
  op <- options()

  op.rym <- list(
    rym.user = Sys.getenv("RYM_USER"),
    rym.token_path = Sys.getenv("RYM_TOKEN_PATH")
  )

  op.rym <- lapply(op.rym, function(x) if (x == "") {
    return(NULL)
  } else {
    return(x)
  })

  toset <- !(names(op.rym) %in% names(op))
  if (any(toset)) options(op.rym[toset])

  invisible()
}
