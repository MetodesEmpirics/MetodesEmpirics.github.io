library(dplyr)
library(stringr)
library(readr)
require('stringi')

assignments <- read_csv('MetodesEmpirics.github.io/material/2022q3/session07/peer-review.csv')
path_to_files     <- 'Downloads/2021-25667-T1-Peer Review II (submit it here)-928137'
files    <- list.files(path = path_to_files)
studs <- str_remove(files, pattern = '_.*')
ids      <- gsub("[^0-9.-]", "", files)


for (id in seq(1:length(studs))){
	print(studs[id])
	assignments$check_eq <- lapply(assignments$students, stri_compare, e2=studs[id])

	sub_df <- assignments %>% filter(check_eq == 0)

	if (nrow(sub_df) == 0){
	reviewed <- readline(prompt = 'Student did not do PR I, manually input who they reviewed: ')
	} else {
		reviewed <- sub_df %>% select(peer_reviews) %>% pull()
	}

	#Now change name of file to something anonymous (this is the ID that Moodle appends to the downloads)
#	name_of_file <- list.files(path = paste0(path_to_files, '/', files[id]))
#	file.rename(from = paste0(path_to_files, '/', files[id], '/', name_of_file), 
#				to   = paste0(path_to_files, '/', files[id], '/', reviewed, '.pdf'))
	file.rename(from = paste0(path_to_files, '/', files[id]), 
				to   = paste0(path_to_files, '/', reviewed, '.pdf'))

}



library(clipr)
df <- read_csv('MetodesEmpirics.github.io/material/2022q3/session07/peer-review.csv')

for (i in seq(1:nrow(df))){
	print(df$students[[i]])
	write_clip(paste0('Buenos días, 

				si tu compañero hizo el peer review II, encontrarás su revisión de tu trabajo en el archivo "', df$ids[[i]], '.pdf" 

				Más información, y el link a la carpeta con todas las revisiones está en Aula Global.

				Saludos, Thomas'))

	readline(prompt = 'Press ANY KEY to continue')
	print('')
	print('')
}