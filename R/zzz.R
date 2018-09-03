.onAttach <- function(lib, pkg,...){
  packageStartupMessage(rymWelcomeMessage())
}

#
#

rymWelcomeMessage <- function(){
  # library(utils)
  
  paste0("\n",
         "---------------------\n",
         "Welcome to rym version ", utils::packageDescription("rym")$Version, "\n",
         "\n",
         "Author:       Alexey Seleznev (Head of analytics dept at Netpeak).\n",
         "Email:        selesnow@gmail.com\n",
         "Blog:         https://alexeyseleznev.wordpress.com \n",
         "Facebook:     https://facebook.com/selesnown \n",
         "Linkedin:     https://www.linkedin.com/in/selesnow \n",
         "Package Site: https://selesnow.github.io \n",
         "\n",
         "Type ?rym for the main documentation.\n",
         "The github page is: https://github.com/selesnow/rym/\n",
         "\n",
         "Suggestions and bug-reports can be submitted at: https://github.com/selesnow/rym/issues\n",
         "Or contact: <selesnow@gmail.com>\n",
         "\n",
         "\tTo suppress this message use:  ", "suppressPackageStartupMessages(library(rym))\n",
         "---------------------\n"
  )
}