#' Reading the avian body sizes data
#'
#' @description Reading, after downloading if needed, the avian body sizes in
#'  the data repository: Lislevand, Terje; Figuerola, Jordi; Szekely, Tamas (2016):
#'  Data Paper. Data Paper. Wiley. Dataset.
#'  https://doi.org/10.6084/m9.figshare.3527864.v1
#' The associated article is: Lislevand, T., Figuerola, J. and Szekely, T. (2007),
#'  AVIAN BODY SIZES IN RELATION TO FECUNDITY, MATING SYSTEM, DISPLAY BEHAVIOR,
#'  AND RESOURCE SHARING. Ecology, 88: 1605-1605.
#'  https://doi.org/10.1890/06-2054
#'
#'
#' @return a \code{data.frame} containing all variables from avian_ssd_jan07.txt
#' @export
#'


reading_avian_body_sizes <- function() {
   create_folders()
   # downloading from figshare, unzipping, deleting the archive.
   if (!file.exists('./data/downloaded_data/traits/avian_body_sizes/avian_ssd_jan07.txt')) {
      download.file(url = 'https://ndownloader.figshare.com/articles/3527864/versions/1', destfile = './data/cache/traits/avian_body_sizes.zip', mode = 'wb')
      unzip(zipfile = './data/cache/traits/avian_body_sizes.zip',
            exdir = './data/downloaded_data/traits/avian_body_sizes')
      file.remove('./data/cache/traits/avian_body_sizes.zip')
   }
   # reading the txt
   return(
      readr::read_delim('./data/downloaded_data/traits/avian_body_sizes/avian_ssd_jan07.txt', delim = '\t', na = '-999')[, 1:41]
   )
}
