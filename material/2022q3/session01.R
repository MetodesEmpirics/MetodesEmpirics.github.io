## -----------------------------------------------------------------------------
print('Welcome to the Quantitative Methods Series')

#A demonstration of R code (to see that the code is running)
x <- 2 #this assigns the value '2' to variable 'x'
y <- 5 #this assigns the value '5' to variable 5

#Running this box of code will print the result of these operations:
x+y 
x*y
x**y


## -----------------------------------------------------------------------------
df_a <- read.csv('df_session01a.csv')
head(df_a)
str(df_a)


## -----------------------------------------------------------------------------
df_b <- read.csv('df_session01b.csv')
head(df_b)
str(df_b)


## -----------------------------------------------------------------------------
df_b <- read.csv('df_session01b.csv',sep='*')
head(df_b)
str(df_b)


## -----------------------------------------------------------------------------
sessionInfo()

