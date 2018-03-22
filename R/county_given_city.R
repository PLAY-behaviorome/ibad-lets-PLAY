county_given_city <- function(city, state) {
  # Error handling
  if (!(is.character(city))) {
    stop("City must be character string.")
  }
  if (!(is.character(city))) {
    stop("State must be character string.")
  }
  
  require(ggmap)
  # Register every time until I pay?
  source("R/google_maps_api.R")
  register_google(key=google.maps.api.key)
  
  g <- geocode(paste0(city, ",", state), output="more")
  # Extract county
  as.character(g$administrative_area_level_2)
}