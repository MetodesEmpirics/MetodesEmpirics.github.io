library(readr)
library(dplyr)
library(tidyr)

participants <- read_csv('participants.csv')
colnames(participants) <- c('first', 'second', 'id', 'grp')
urls <- c()


for (idx in participants$id){
	lng <- nchar(idx)
	nidx <- as.integer(substring(idx,2,lng))
	print(nidx)
	set.seed(nidx)

	sentence_type <- rep(seq(1,5),12)

	s_unmod <- rnorm(n=60, mean=330, sd=20)
	s_mod   <- rnorm(n=60, mean=300, sd=20)

	z_unmod <- rnorm(n=60, mean=580, sd=20)
	z_mod   <- rnorm(n=60, mean=450, sd=20)


	s.df <- tibble(Amb   = s_unmod,
				   Unamb = s_mod,
				   sentence.ID = sentence_type)
	z.df <- tibble(Amb   = z_unmod,
				   Unamb = z_mod,
				   sentence.ID = sentence_type)

	z.df <- z.df %>% pivot_longer(!sentence.ID, names_to='status',values_to = 'reading.time') %>% mutate(type = 'npz')


	s.df <- s.df %>% pivot_longer(!sentence.ID, names_to='status',values_to = 'reading.time') %>% mutate(type = 'nps')

	df <- bind_rows(z.df,s.df)



	write_csv(df, paste0('csvs/',idx, '.csv'))
	urls <- c(urls, paste0('https://raw.githubusercontent.com/MetodesEmpirics/MetodesEmpirics.github.io/main/material/2024q3/session08/data/csvs/', idx, '.csv'))
}

participants$dades  <- urls
participants$first  <- NULL
participants$second <- NULL
participants$grp <- NULL

write_csv(participants,'dades_prova_puntuable24.csv')
