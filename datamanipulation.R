gapminder <- read.csv("../data/gapminder_data.csv")

africa_mean_gdp <- mean(gapminder$gdpPercap[gapminder$continent == "Africa"])

library("dplyr")

year_country_gbd <- select(gapminder, year, country, gdpPercap)

smaller_gapminder_data <- select(gapminder, -continent)
#Select function allows you to remove column using -name of column
year_country_gbp2 <- gapminder%>%
  select(year, country, gdpPercap)
tidy_gdp <- year_country_gbp2 %>% 
  rename(gdp_per_capita = gdpPercap
         )
#renaming column
head(tidy_gdp)
#annual gdp for europe

year_country_gdp_euro <- gapminder %>%
  filter(continent=="Europe") %>% 
  select(year, country, gdpPercap)
View(year_country_gdp_euro
     )
europe_lefeExp_2007 <- gapminder %>%
  filter(continent == "Europe", year ==2007) %>%
  select(country, lifeExp)
View(europe_lefeExp_2007)

africa_lefe <- gapminder %>%
  filter(continent == "Africa") %>%
  select(lifeExp, country, year)
View(africa_lefe)
## shift ctrl m brings the pipe
