## -----------------------------------------------------------------------------------------
heights1 <- c(170,178,162,166,183,185) #a vector of heights in cms

mean(heights)


## -----------------------------------------------------------------------------------------
sort(heights) #not necessary to compute median, just for illustration
median(heights)

sort(heights2) #not necessary to compute median, just for illustration
median(heights2)


## -----------------------------------------------------------------------------------------

heights3 <- c(170,178,162,166,183,185,188,300) #a vector of heights in cms
mean(heights3)
median(heights3)


## -----------------------------------------------------------------------------------------
#Let's automatize and let the computer create some data for us

#We will simulate reaction times (in milliseconds)
#Starting small, generating just 10 observations and telling R that the central tendency is 150 ms, with 20 ms of standard deviation

sim_reaction_times <- rnorm(n = 10, mean = 150, sd = 20) #sample 1000 times from a Normal distribution with mean 150 and sd of 20
print(sim_reaction_times) #look at what reaction times we sampled
plot(sim_reaction_times) #visualize the reaction times we sampled

mean(sim_reaction_times) #calculate their mean
median(sim_reaction_times) #calculate their median


#The same thing, but now with more observations sampled

sim_reaction_times <- rnorm(n = 1000, mean = 150, sd = 20) #sample 1000 times from a Normal distribution with mean 150 and sd of 20
print(sim_reaction_times) #look at what reaction times we sampled
plot(sim_reaction_times) #visualize the reaction times we sampled

mean(sim_reaction_times) #calculate their mean
median(sim_reaction_times) #calculate their median

plot(density(sim_reaction_times))

#Changing the generating distribution
sim_reaction_times_g <- rgamma(n = 1000, shape=1, scale=150) #sample 1000 times from a Gamma distribution with mean 150 and sd of 20

plot(sim_reaction_times_g)

mean(sim_reaction_times_g)
median(sim_reaction_times_g)

plot(density(sim_reaction_times_g))


## -----------------------------------------------------------------------------------------
heights
var(heights)
sd(heights) #the same as sqrt(var(heights))

#Unpacking variance and standard deviation
x_bar <- mean(heights) #this is the mean of the heights
print(x_bar)

dev_heights <- heights - x_bar #deviations of each height from the mean
print(dev_heights)

squared_dev_heights <- devs_heights**2 #squared deviations from the mean
print(squared_dev_heights)

sum_squared_dev_heights <- sum(squared_dev_heights) #sum of the squared deviations
print(sum_squared_dev_heights)

var_heights <- ( 1 / (length(heights)-1) ) * sum_squared_dev_heights #divide by number of observations - 1
print(var_heights)

print(sqrt(var_heights)) #square root of the variance = std


## -----------------------------------------------------------------------------------------
sessionInfo()

