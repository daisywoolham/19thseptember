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
