# token class
print.RymToken <- 
    function(x, ...) {
    
      cat(" Yandex Metrica Authorization Token \n",
          "User:", x$username,"\n",
          "Expire at", as.character(x$expire_at))
      
}
