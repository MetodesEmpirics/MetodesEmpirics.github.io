library(readr)
library(dplyr)
library(tidyr)

participants <- read_csv('participants.csv')
colnames(participants) <- c('first', 'second', 'id')



for (idx in participants$id){
	lng <- nchar(idx)
	nidx <- as.integer(substring(idx,2,lng))
	print(nidx)
	set.seed(nidx)

	sentence_type <- rep(seq(1,5),12)

	icv1_act <- rbinom(n=60, size = 1, prob = 0.93)
	icv1_pass <- rbinom(n=60, size = 1, prob = 0.93)

	icv2_act  <- rbinom(n=60, size = 1, prob = 0.45)
	icv2_pass <- rbinom(n=60, size = 1, prob = 0.10)


	icv1 <- tibble(active   = icv1_act,
				   passive =  icv1_pass,
				   sentence.ID = sentence_type)
	icv2 <- tibble(active   = icv2_act,
				   passive  = icv2_pass,
				   sentence.ID = sentence_type)

	icv1 <- icv1 %>% pivot_longer(!sentence.ID, names_to='status',values_to = 'subject') %>% mutate(type = 'icv1')


	icv2 <- icv2 %>% pivot_longer(!sentence.ID, names_to='status',values_to = 'subject') %>% mutate(type = 'icv2')

	df <- bind_rows(icv1,icv2)


	write_csv(df, paste0('csvs/',idx, '.csv'))


}


