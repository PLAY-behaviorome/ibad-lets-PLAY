authenticate_db <- function(vb = FALSE) {
  # Authenticates to Databrary.
  # 
  # Args:
  #  vb: Flag specifying whether to provide vb status messages. Default is FALSE.

  if (!exists("databrary_config_status")) {
    source("config_db.R")
    config_db(vb = vb)
  }

  # This gives 405 Method Not Allowed. Has method changed?
  if (".databrary.RData" %in% dir(all.files=TRUE)){
    load(".databrary.RData")
    
    # Don't print cookie to console via cat()
    sink("tmp")
    set_config(config(cookie = cat(paste0('session=\"', databrary.SESSION, '\"'))))
    sink()
    system("rm tmp")
    
    auth.url <- paste0(databrary.url, "/volume/1")
    r <- GET(auth.url)
    if (vb) {
      cat(sprintf("\nGET command to %s\n", auth.url))
    }
    if (status_code(r) != 200){
      if (vb) {
        cat(sprintf("\nStatus %i. Must login again.\n", status_code(r)))
      }
      source("login_db.R")
      login_db(vb = vb)
    } else if(vb) {
      cat("\nAuthenticated to Databrary.\n")
    }
  } else {
    source("login_db.R")
    login_db(vb = vb)
  }
}