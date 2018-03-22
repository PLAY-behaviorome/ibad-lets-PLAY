fips_given_county <- function(this.county, this.state, 
                              county.file = "csv/state-county-fips.csv") {
  if (!(is.character(this.county))) {
    stop("County must be character string.")
  }
  counties <- read.csv(county.file)
  
  r <- counties %>% filter(countyname == as.character(this.county),
                           state == as.character(this.state))
  if (!(is.null(r))) {
    fips <- r$statefp*1000 + r$countyfp
    return(fips)
  }
}