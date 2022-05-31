#' Reading the ELEData AVONET data raw traits
#'
#' @description Reading, after downloading if needed, the raw trait data from
#' ELEData Avonet database
#' Tobias, Joseph (2021): AVONET: morphological, ecological and geographical
#' data for all birds (Tobias et al 2022 Ecology Letters doi:
#' https://doi.org/10.111/ele.13898). figshare. Dataset.
#' https://doi.org/10.6084/m9.figshare.16586228.v5
#'
#' This database also has phylogenic data
#'
#' @return a dataframe of birds traits
#' @export
#'


reading_ELEData_raw_traits <- function() {
   # downloading from figshare, unzipping the archive.
   if (!file.exists('./downloaded data/traits/ELEData_avonet/ELEData/TraitData/AVONET_Raw_Data.csv')) {
      download.file(url = 'https://figshare.com/ndownloader/files/34480865', destfile = './cache/traits/ELEData_avonet.zip', mode = 'wb')
      unzip(zipfile = './cache/traits/ELEData_avonet.zip',
            exdir = './downloaded data/traits/ELEData_avonet')
   }

   # reading the csv
   return(
      data.table::fread('./downloaded data/traits/ELEData_avonet/ELEData/TraitData/AVONET_Raw_Data.csv', sep = ',', dec = '.', header = TRUE, select = 1L:26L)
   )
}
