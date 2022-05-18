library(stringr)
library(readr)

if (!file.exists('MetodesEmpirics.github.io/material/2022q3/session07/peer-review.csv')){
path_to_files     <- 'Downloads/2021-25667-T1-Peer review I-917477'
files    <- list.files(path = path_to_files)
students <- str_remove(files, pattern = '_.*')
ids      <- gsub("[^0-9.-]", "", files)


groups       <- c()
anons        <- c()
peer_reviews <- c()

for (id in seq(1:length(students))){
	print(students[id])
	group     <- readline(prompt = 'Enter group ID or 0: ')
	anonymous <- readline(prompt = 'Is the work anonymous? (0/1): ')

	if (id < length(students)){
		peer_reviews <- c(peer_reviews, ids[id+1]) #checks work of the next person in line
	} else {
		peer_reviews <- c(peer_reviews,ids[1])
	}

	groups <- c(groups,group)
	anons  <- c(anons, anonymous)

	#Now change name of file to something anonymous (this is the ID that Moodle appends to the downloads)
	name_of_file <- list.files(path = paste0(path_to_files, '/', files[id]))
	file.rename(from = paste0(path_to_files, '/', files[id], '/', name_of_file), 
				to   = paste0(path_to_files, '/', files[id], '/', ids[id], '.pdf'))

}

#df <- data.frame(students, ids, groups, anons, peer_reviews, files)
#write_csv(df, 'MetodesEmpirics.github.io/material/2022q3/session07/peer-review.csv')
}


library(clipr)
df <- read_csv('MetodesEmpirics.github.io/material/2022q3/session07/peer-review.csv')

for (i in seq(1:nrow(df))){
	print(df$students[[i]])
	write_clip(paste0('Buenos días, 

				para el Peer Review II tienes que darle feedback al trabajo "', df$peer_reviews[[i]], '.pdf" 

				El link a la carpeta con todos los proyectos está en Aula Global.

				Saludos, Thomas'))

	readline(prompt = 'Press ANY KEY to continue')
	print('')
	print('')
}