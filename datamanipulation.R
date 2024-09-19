library(ggplot2)
library(dplyr)
#import data

gapminder <- read.csv("../data/gapminder_data.csv")
#R norm generates random numbers
x <- rnorm(1e6)
hist(x, breaks = 100)
mean_x <- mean(x)
manual_mean_x <- sum(x)/length(x)
mean_x == manual_mean_x

all.equal(mean_x, manual_mean_x)
##can override the tolderance for specific sums
library(ggplot2)
gapminder <- read.csv("Day2/data/gapminder_data.csv")
## ggplot- first thing data frame, 2nd thing aes- mapping x then y
life_exp_plot <- ggplot(gapminder, aes(year, lifeExp)) + geom_point(alpha = 0.3, size = 0.2)

by_continent_plot <- life_exp_plot + facet_wrap(vars(continent))

#can add additional layers to plots 
#facet wrap splits into continents

ggsave("results/lifeExpectancybycontinent.pdf", by_continent_plot)
#square brackets for subset, comma space for rows

gap_australia <- gapminder[gapminder$country =="Australia", ]
head(gap_australia)

write.csv(gap_australia, "results/gapminder-australia.csv", row.names = FALSE)

country_lifeExp <- gapminder[gapminder$country =="Vietnam", c("country", "lifeExp")]

head(country_lifeExp)
write.csv(country_lifeExp,"results/gapminder-vietnam.csv", row.names= FALSE
)

## character vector- anything with letters