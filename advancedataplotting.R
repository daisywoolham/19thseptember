library(ggplot2)
install.packages("colorspace")
library(ggplot2)

gapminder <- read.csv("../data/gapminder_data.csv")

americas <- gapminder[gapminder$continent== "Americas", ]



americas %>% 
ggplot(mapping =aes(x = year, y= lifeExp)) +
  geom_line() +
  facet_wrap(~country) + 
  theme(axis.text.x = element_text(angle=45))

#use of mutate

gapminder %>% 
  #extract first letter of country into new column
  mutate(startsWith = substr(country,1,1)) %>% 
 #only keeping countries starting with A or Z
filter (startsWith %in% c("A", "Z")) %>% 
#plot lifeExp into facts
ggplot(aes(x = year, y = lifeExp, colour = continent)) + geom_line() +
  facet_wrap(vars(country)) + 
  theme_minimal()

gapminder %>% 
  filter(year==2002) %>% 
  group_by(continent, country) %>% 
  summarise(average_life_exp_random_by_continent1= mean(lifeExp)) %>% 
  sample_n(size=2)

##sample_n picks x number from within field, randomly  