library(dplyr)
library(stringr)
library(readr)
require('stringi')

path_to_files     <- 'Downloads/Peer-rev2/2022-25667-T1-Peer Review II (submit it here)-1080906'
files    <- list.files(path = path_to_files)
#studs <- str_remove(files, pattern = '_.*')

revs_to <- str_remove(files, pattern = '.*_file_')
revs_to <- str_remove(revs_to, pattern = '.*_')
revs_to

for (id in seq(1:length(files))){
	file.rename(from = paste0(path_to_files, '/', files[id]), 
				to   = paste0('Downloads/Peer-rev2/clean-peer-ii', '/', id, revs_to[id]))

}