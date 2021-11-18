## -----------------------------------------------------------------------------
heights1 <- c(170,178,162,166,183,185) #a vector of heights in cms

(170 + 178 + 162 + 166 + 183 + 185) * (1 / 6) #calculating the mean explicitly

sum(heights1) * (1 / length(heights1)) #using sum() and length() functions

mean(heights1) #using the mean() function directly


## -----------------------------------------------------------------------------
sort(heights1) #not necessary to compute median, just for illustration
median(heights1)

heights2 <- c(170,178,162,166,183,185,155) #a vector of heights in cms
sort(heights2) #not necessary to compute median, just for illustration
median(heights2)


## -----------------------------------------------------------------------------

heights3 <- c(170,178,162,166,183,185,188,300) #a vector of heights in cms
mean(heights3)
median(heights3)


## -----------------------------------------------------------------------------
set.seed(333)
#Let's let the computer generate the data
#We will simulate reaction times (in milliseconds)

#Starting small, sampling just 5 observations and telling R that the population's mean is 150 ms, with 40 ms of standard deviation

sim_reaction_times <- rnorm(n = 5, #number of samples
                            mean = 150, #mean of the normal distribution
                            sd = 40) #std. deviation of the normal distribution

sim_reaction_times #look at what reaction times we sampled
hist(sim_reaction_times, #data we are plotting
     main = 'Simulated reaction times (small sample)', #title of our histogram
     xlab = 'Reaction time')  #Label of x-axis

mean(sim_reaction_times) #calculate their mean
median(sim_reaction_times) #calculate their median


#The same thing, but now with 1000 observations sampled

sim_reaction_times <- rnorm(n = 1000, mean = 150, sd = 20) #sample 1000 times from a Normal distribution with mean 150 and sd of 20
hist(sim_reaction_times) #visualize the reaction times we sampled

mean(sim_reaction_times) #calculate their mean
median(sim_reaction_times) #calculate their median

plot(density(sim_reaction_times))

#Changing the generating distribution
sim_reaction_times_g <- rgamma(n = 1000, shape=1, scale=150) #sample 1000 times from a Gamma distribution with mean 150 and sd of 20

hist(sim_reaction_times_g)

mean(sim_reaction_times_g)
median(sim_reaction_times_g)

plot(density(sim_reaction_times_g))


## -----------------------------------------------------------------------------
heights1
var(heights1)
sd(heights1) #the same as sqrt(var(heights))

#Unpacking variance and standard deviation
x_bar <- mean(heights1) #we assign this number to a variable named x_bar
x_bar

dev_heights <- heights1 - x_bar #deviations of each height from the mean
dev_heights

squared_dev_heights <- dev_heights**2 #squared deviations from the mean
squared_dev_heights

sum_squared_dev_heights <- sum(squared_dev_heights) #sum of the squared deviations
sum_squared_dev_heights

var_heights <- ( 1 / (length(heights1)-1) ) * sum_squared_dev_heights #divide by number of observations - 1
var_heights

sqrt(var_heights) #square root of the variance = std


## -----------------------------------------------------------------------------
sessionInfo()

