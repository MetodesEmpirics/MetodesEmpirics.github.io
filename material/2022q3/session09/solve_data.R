library(dplyr)

library(dplyr)

inv.logit <- function(x){
                          return(
                                  exp(x) / (1 + exp(x))
                                )
                        }

student_id <- readline(prompt= 'Enter student ID: ')

df <- read.csv(paste0('https://raw.githubusercontent.com/MetodesEmpirics/MetodesEmpirics.github.io/main/material/2022q3/session08/data/csvs/',
				student_id,
				#u103672,
				'.csv')
				)

cat('\n')
print(paste0('### Descriptive statistics ', student_id,' ###'))
print(paste0('1. What is the median interpretation of pronouns as refering to the subject in active ICV1 sentences?'))
df %>% filter(status == 'active', type == 'icv1') %>% select(subject) %>% pull %>% median() %>% round(2)

cat('\n')

print(paste0('2.What is the variance of the interpretation rate of pronouns as refering to the subject in active ICV1 sentences?'))
df %>% filter(status == 'active', type == 'icv1') %>% select(subject) %>% pull %>% var() %>% round(2)


cat('\n')

print(paste0('3. What is the median interpretation of pronouns as refering to the subject in passive ICV1 sentences?'))
df %>% filter(status == 'passive', type == 'icv1') %>% select(subject) %>% pull %>% median() %>% round(2)

cat('\n')

print(paste0('4. What is the variance of the interpretation rate of pronouns as refering to the subject in passive ICV1 sentences?'))
df %>% filter(status == 'passive', type == 'icv1') %>% select(subject) %>% pull %>% var() %>% round(2)


cat('\n')

print(paste0('5. What is the median interpretation of pronouns as refering to the subject in active ICV2 sentences?'))
df %>% filter(status == 'active', type == 'icv2') %>% select(subject) %>% pull %>% median() %>% round(2)

cat('\n')

print(paste0('6. What is the variance of the interpretation rate of pronouns as refering to the subject in active ICV2 sentences?'))
df %>% filter(status == 'active', type == 'icv2') %>% select(subject) %>% pull %>% var() %>% round(2)

cat('\n')

print(paste0('7. What is the median interpretation of pronouns as refering to the subject in passive ICV2 sentences?'))
df %>% filter(status == 'passive', type == 'icv2') %>% select(subject) %>% pull %>% median() %>% round(2)

cat('\n')

print(paste0('8. What is the variance of the interpretation of pronouns as refering to the subject in passive ICV2 sentences?'))
df %>% filter(status == 'passive', type == 'icv2') %>% select(subject) %>% pull %>% var() %>% round(2)

cat('\n\n\n')

readline(prompt= 'Press any key to continue')
cat("\014")  

cat('\n\n')

print(paste0('### Inferential statistics ', student_id, ' ###'))
print(paste0('1.The difference between passive and active ICV1 sentences; the standard error of this difference; and the probability of a pronoun referring the the object in a passive sentence.'))
df_icv1 <- filter(df, type == 'icv1')
model_icv1 <- glm(formula = subject ~ status, data = df_icv1, family=binomial(link = 'logit'))
smodel_icv1 <- summary(model_icv1)
round(smodel_icv1$coefficients[2,1:2],2)

round(1 - inv.logit(smodel_icv1$coefficients[1,1] + smodel_icv1$coefficients[2,1]),2)

cat('\n\n')
print(paste0('2. The difference between passive and active ICV2 sentences; the standard error of this difference; and the probability of a pronoun referring to the object in a passive sentence.'))
df_icv2 <- filter(df, type == 'icv2')
model_icv2 <- glm(formula = subject ~ status, data = df_icv2, family=binomial(link = 'logit'))
smodel_icv2 <- summary(model_icv2)
round(smodel_icv2$coefficients[2,1:2],2)

round(1 - inv.logit(smodel_icv2$coefficients[1,1] + smodel_icv2$coefficients[2,1]),2)

cat('\n\n')
print('3. Based on your answer to (1): Do you think there is evidence to suggest a difference between active and passive ICV1 sentences? Why (not)? ')
print('No. The difference is minuscule if existent')


cat('\n\n')
print('4. Based on your answer to (2): Do you think there is evidence to suggest a difference between active and passive ICV2 sentences? Why (not)? ')
print('Yes. The difference is still pretty large by comparison to the standard error')

cat('\n\n')
print('5. Your colleague suggests to compare the models used for (1) and (2) using the Akaike Information Criterion.')
print('Is this a good idea? If so, which model performs better? If not, why and how could you compare the two models performance instead?')

print('Bad idea. Use accuracy or RMSE.')

cat('\n\n')
print('6. Do your findings agree with the expectations from the literature? Explain why (not).')
print('This is an open question and it depends on the dataset. But the most common answer is:')
print('Partially. No difference between active and passive for ICV1 but in ICV2 there is one + ICV1 biases subjects and ICV2 objects')

print('### ### ###')

