Init_cap <- function(s) {
  stopifnot(is.character(s))
  paste0(toupper(stringr::str_sub(s,1,1)), 
         stringr::str_sub(s,2,str_length(s)))
}