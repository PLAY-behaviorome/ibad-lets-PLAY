logout_db <- function(logout.url="/api/user/logout", return.response=FALSE, vb=TRUE){
  # databrary.logout( logout.url="/api/user/logout", vb=TRUE )
  #
  # Logs out user.
  #----------------------------------------------------------
  
  if (!exists("databrary_config_status")) {
    source("config_db.R")
    config_db(vb = vb)
  }
  
  r <- POST(paste0(databrary.url, logout.url))
  
  if (status_code(r) == 200){
    if (vb) cat( 'Logout Successful.\n' )
    if (file.exists(".databrary.RData")) file.remove(".databrary.RData")
  } else if (vb) cat( paste('Logout Failed, HTTP status ', status_code(r), '\n', sep="" ))
  if (return.response) return(r)
}
