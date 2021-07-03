## Data Visualization ICPSR Summer 2021> 
## Name: Sarah Warren
## Date: June 30
## I'm so sorry this is late, I thought it was due Thursday

library(tidyverse)
library(readxl)

truth <- c("ICPSR is the best summer stats program!")
class(truth)
colors <- c("red", "blue", "green", "red", "blue")
factor_colors <- colors %>%
  factor()
class(factor_colors)

factor2_colors <- factor(colors, levels = c("red", "blue"))
class(factor2_colors)
#This tells us that factors' levels are set manually and that the levels are dependent on the level set by the researcher.
#The number of levels determines the number of categories in our categorical variable
#The corresponding numbers are counts in each of our color bins - we now have an NA for green because we didn't include it in our levels

summary(colors)
summary(factor_colors)
summary(factor2_colors)
#Each factor has a total length of five, but one is "green" in factor_colors and NA in factor2_colors because we didn't include a level for green

ideology <- c("liberal", "conservative", "very liberal", 'very conservative', 
              'middle of the road', 'slightly conservative', 'slightly liberal', 
              'liberal', 'conservative', 'middle of the road')

fact_ideo <- factor(ideology, levels = c("very liberal", "liberal", "slightly liberal",
                                         "middle of the road", "slightly conservative",
                                         "conservative", "very conservative"))
respondent <- c('Susie', 'Abdul', 'Maria', 'Fred', 'Wilma', 'Barney', 'Dino', 
                'Ajax', 'Thor', 'Betty')


income <- c(100000, 75000, 48000, 62000, 31000, 52500, 274000, 88000, 21000, 74000)

data1 <- data.frame("ideology" = ideology, "respondent" = respondent, "income" = income)
head(data1)
tail(data1)
structure(data1)

orderdat <- data1 %>%
  arrange(desc(income))
orderdat

data1 %>%
  filter(income == 21000) %>%
  glimpse()

#Select from data1 the names of all the respondents starting with Fred and
#ending with Ajax. There are a number of ways to do this.

data1$log_income <- log(data1$income, base = exp(1)) %>%
  glimpse()

survey <- list(respondent, ideology, income)
#it's a list of three and each component contains ten numeric or character items

session <- 2
weeks <- matrix(1:9, byrow = TRUE, ncol=3)
print(weeks)
dv_list <- list(truth=truth, sess1=session, wk=weeks, dat=data1, svy=survey)
dv_list$wk[2,2]

print(dv_list$dat$income) # get baseline
dv_list$dat$income <- dv_list$dat$income/2
print(dv_list$dat$income) #success!

data("swiss")
head(swiss)
swiss_tibble <- as_tibble(swiss); swiss_tibble

swiss$Agriculture

swiss %>%
  filter(Agriculture < 50) %>%
  glimpse()

swiss %>%
  filter(Catholic > 50 & Fertility < 70) %>%
  glimpse()

movie <- read_csv("movie.csv")
structure(movie)
glimpse(movie)

summary(movie$budget)

movie <- movie %>%
  mutate(budget2 = budget/100000000, length = duration/60) %>%
  glimpse()

## stuck??? Subset the movie dataset from ”Spectre” to ”Skyfall.” Use the titles in
## movie_title to do this, not row and column numbers.

##I think its the stringr subset command, but I could not get the function to do what I wanted

wiid <- read_excel("WIID_31MAY2021_0.xlsx")
head(wiid)
tail(wiid)

##I pulled the most recent dataset from 2021 - but the regions are not numeric
#https://www.wider.unu.edu/database/world-income-inequality-database-wiid

wiid2<- wiid %>% filter(region_wb == "North America" | country == "Mexico") %>%
  glimpse()

ggplot(wiid2, aes(x=year, y=gini, color = country, fill=country)) + 
  geom_point() + theme_minimal()
#it appears that th enumber of observations increase as time goes on - there is more data
#after 1980 than before it, so the graph becomes quite cluttered quite quickly.
#We also appear to have some duplicate observations in the same year

ggplot(wiid2, aes(x=year, y=gini, color = country, fill=country)) + 
  geom_line() + theme_minimal()
#this did not help much, but it helped a little

wiid %>%
  summarize(median_g=median(gini, na.rm=TRUE), median_1=median(q1, na.rm=TRUE),
            median_5=median(q5, na.rm=TRUE)) 
# I am very not confident in what I have done here
#but I have indeed done something

wiid %>% 
  filter(year == 2005) %>%
  summarize(min_gini = min(gini, na.rm=TRUE),
            min_q1 = min(q1, na.rm=TRUE),
            min_q5 = min(q5, na.rm=TRUE))

wiid %>% 
  filter(region_un == 'Africa') %>%
  summarize(max_gini = max(gini, na.rm=TRUE),
            max_d1 = max(d1, na.rm=TRUE),
            max_d10 = max(d10, na.rm=TRUE))
  
reasonable <- wiid %>%
  filter(region_wb == "North America" | country == "Mexico") %>%
  group_by(year, country) %>%
  summarize(mean_gini = mean(gini, na.rm = TRUE))

ggplot(reasonable, aes(x=year, y=mean_gini, color = country, fill=country)) + 
  geom_line() + theme_minimal()
