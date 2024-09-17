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
str(gapminder)
str(gapminder %>% group_by(continent))
##group by lays things out a bit differently

gdp_by_continents <- gapminder %>% 
  group_by(continent) %>% 
summarize(mean_gdpPercap=mean(gdpPercap), 
          median=median(gdpPercap)) 
##as we've grouped, we have to use summarise to get an overview- group and summarise go together

avg_life_exp <- gapminder %>% 
  group_by(country) %>% 
  summarize (mean_life_exp=mean(lifeExp),
             min=min(lifeExp),
             max=max(lifeExp))
avg_life_exp <- gapminder %>% 
  group_by(country) %>% 
  summarize (mean_life_exp=mean)
avg_life_exp %>% 
  filter(mean_life_exp==min(mean_life_exp)|(mean_life_exp==max(mean_life_exp)))
avg_life_exp %>% 
  arrange(mean_life_exp) %>% 
  head(1)
#sort alphabetically by country
avg_life_exp %>% 
  arrange(desc(country))
##sort and summarise by 2 variables
gdp_by_continent_by_year <- gapminder %>% 
  group_by(continent,year) %>% 
  summarize(mean_gdp_Per_cap=mean(gdpPercap) ,
            sd_gdp_percap=sd(gdpPercap) ,
            mean_pop = mean(pop))
view(gdp_by_continent_by_year)
##count
gapminder %>% 
  filter(year==2002)%>% 
  count(continent, sort = TRUE)

gapminder %>% 
  group_by(continent) %>% 
  summarize(se_le=sd(lifeExp)/sqrt(n()))
#n is a proxy for the county of the data per continent

##mutate
gdp_pop_by_continents_by_year <- gapminder %>% 
  mutate (gdp_billion = gdpPercap*pop/10^9) %>% 
group_by (continent, year) %>% 
  summarize (mean_gdpPercap = mean(gdpPercap) ,  
             sd_gdpperCap = sd(gdpPercap) , 
             mean_gdp_billion = mean(gdp_billion) ,  
             sd_gdp_billion = sd(gdp_billion))
head(gdp_pop_by_continents_by_year)
#filter

gdp_pop_by_continents_by_year_above_55 <- gapminder %>% 
  mutate (gdp_billion = ifelse(lifeExp> 55, gdpPercap*pop/10^9, NA)) %>% 
  group_by (continent, year) %>% 
  summarize (mean_gdpPercap = mean(gdpPercap) ,  
             sd_gdpperCap = sd(gdpPercap) , 
             mean_gdp_billion = mean(gdp_billion) ,  
             sd_gdp_billion = sd(gdp_billion))
head(gdp_pop_by_continents_by_year_above_55)
