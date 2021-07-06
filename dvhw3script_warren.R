## Data Visualization ICPSR Summer 2021> 
## Name: Sarah Warren
## Date: June 30

#load packages
library(tidyverse)
library(readxl)
library(viridis) #I am partially color blind, so yay viridis!
library(gridExtra)
library(grid)

#############
movie <- read_csv("movie.csv") %>%
  na.omit
head(movie)
tail(movie)

ggplot(movie, aes(x=imdb_score, color=color, fill=color)) + 
  geom_histogram() + theme_minimal() 

ggplot(movie, aes(x=imdb_score, y=..density..)) + facet_grid(vars(color)) +
  geom_histogram() + theme_minimal() 


###########

wiid <- read_excel("WIID_31MAY2021_0.xlsx")
asia <- wiid %>%
  filter(region_un == "Asia") %>%
  glimpse()

ggplot(asia, aes(x=gini, y=..density.., fill=region_un_sub)) +
  geom_density(alpha=.3) + 
  theme_minimal() + 
  labs(title = "Income Inequality in Asia", 
       fill = "Sub-Region",
       x = "Gini Coefficient",
       y = "Density") + 
  scale_fill_viridis() +
  scale_fill_viridis(discrete = TRUE) 
#ggsave("Figs/income_inequality_asia.jpeg")


europe <- wiid %>%
  filter(region_un == "Europe") %>%
  group_by(country) %>%
  summarize(mean_gini = mean(gini, na.rm = TRUE))

ggplot(europe, aes(x=country, y=mean_gini)) + geom_point() + coord_flip() +
  theme_minimal() + theme(text = element_text(size=6)) +
  labs(x = " ",
       y = "Mean Gini") + 
  scale_fill_viridis() +
  scale_fill_viridis(discrete = TRUE) 
#ggsave("Figs/europe_gini_scatter.jpeg")

africa <- wiid %>%
  filter(region_un == "Africa") %>%
  group_by(country) %>%
  summarize(gini = gini, mean_gini = mean(gini, na.rm = TRUE)) %>%
  ungroup() %>%
  summarize(country = country, mean_gini = mean_gini, country_mean_gini = mean(gini, na.rm = TRUE)) %>%
  glimpse()

africa$gini_diff <- (africa$mean_gini - africa$country_mean_gini)
#values > mean are positive, < mean are negative
neg <- ifelse(africa$gini_diff<0,1,0) #for graph

africa <- africa %>%
  mutate(neg = as.factor(neg)) #ggplot wants this to be continuous so I made it a factor

ggplot(africa, aes(x=country, y=gini_diff, fill=neg)) + 
  geom_col(show.legend = FALSE) + 
  scale_fill_manual(values=c("#E69F00", "#56B4E9")) +
  theme_minimal() + coord_flip() +
  theme(text = element_text(size=5),
        axis.text.x = element_text(angle=90, hjust=1)) +
  labs(title = "Difference from Mean Gini Value By African Country",
    x = " Country",
       y = "Difference from Mean (47)")
#ggsave("Figs/diff_mean_gini_africa.jpeg")


ggplot(wiid, aes(x=gini, y=..density.., fill=region_un)) + geom_histogram(alpha=.6) +
  scale_fill_manual(values=c("#f0e442", "#cc79a7", "#d55e00", "#009e73", "#0072b2")) +
  theme_minimal() +
  labs(x = "Gini Coefficient",
       fill = "Region",
       y = "Density")
##color-blind friendly

med <- wiid %>%
  filter(region_un == "Americas") %>%
  group_by(region_un_sub, year) %>%
  summarize(med_gini = median(gini, na.rm = TRUE))

ggplot(med, aes(x=year, y=med_gini, color=region_un_sub)) + 
  geom_point() + 
  theme_minimal() +
  labs(x = "Year",
       color = "Region",
       y = "Median Gini Coeff.") +
  scale_color_manual(values=c("#f0e442", "#cc79a7", "#d55e00", "#009e73", "#0072b2"))
  

ggplot(med, aes(x=year, y=med_gini, color=region_un_sub)) + 
  geom_smooth(alpha=.2) + 
  theme_minimal() +
  labs(x = "Year",
       color = "Region",
       y = "Median Gini Coeff.") +
  scale_color_manual(values=c("#f0e442", "#cc79a7", "#d55e00", "#009e73", "#0072b2"))
#ggsave("Figs/median_gini_americas.jpeg")

distinct(movie, language)

movie %>% count(language, color) %>%
  arrange(language, color)

vector1 <- c(1:10)
vector2 <- c(1, 4, 11)

vector1 %in% vector2 #a T/F for every element in v1
vector2 %in% vector1 #a T/F for every element in v2

###stuck

#I have downloaded the stringr cheat sheet. My proof is in my github
#https://github.com/SarahRWarren/Data-Vis

movie %>% count(genres) # pipe delimited multi-genres

movie$action <- str_detect(movie$genres, "Action")
movie %>% count(action) #959 action movies

movie$animated <- str_detect(movie$genres, "Animation")
movie %>% count(animated) #196 animated movies

movie$comedy <- str_detect(movie$genres, "Comedy")
movie$drama <- str_detect(movie$genres, "Drama")

#comedy
c <- movie %>%
  filter(comedy == TRUE & drama == FALSE) %>%
  group_by(title_year) %>%
  summarize(com_mean = mean(imdb_score, na.rm = TRUE)) %>%
  glimpse()

#drama
d <- movie %>%
  filter(comedy == FALSE & drama == TRUE) %>%
  group_by(title_year) %>%
  summarize(dram_mean = mean(imdb_score, na.rm = TRUE)) %>%
  glimpse()

#dramedy
cd <- movie %>%
  filter(comedy == TRUE & drama == TRUE) %>%
  group_by(title_year) %>%
  summarize(cd_mean = mean(imdb_score, na.rm = TRUE)) %>%
  glimpse()

fig <- merge(c, d, by = "title_year")
fig <- merge(fig, cd, by = "title_year")
#is this elegant? not really. did it work? I think.

c <- ggplot(fig, aes(x=title_year, y=com_mean)) + geom_point() + geom_smooth(color = '#FF0000') +
  theme_minimal() +
  labs(title = "Comedy Scores By Year",
       x = "Mean Imdb Score",
       y = "Year")
d<- ggplot(fig, aes(x=title_year, y=dram_mean)) + geom_point() + geom_smooth(color = "#0000FF") +
  theme_minimal() +
  labs(title = "Drama Scores By Year", 
       x = "Mean Imdb Score",
       y = "Year")
cd <- ggplot(fig, aes(x=title_year, y=cd_mean)) + geom_point() + geom_smooth(color = "#6a0dad") +
  theme_minimal() +
  labs(title = "Dramedy Scores By Year",
       x = "Mean Imdb Score",
       y = "Year")
grid.arrange(c,d,cd)
#alt. grid.arrange(c,d,cd, ncol=3)
#Problems: These arranged scatters are going to appear differently depending on the dimensions in which they're saved
#They're not overlapping - is that a transparency issue? Their scales are almost identical, but off by 0.5
#Advantages: I think it's easier to see this way, not overlapping, with only the lines colored

df <- wiid %>%
  filter(year > 1940)

df2 <- select(df, -region_un)

##tsv stuff

ggplot(df, aes(x=year, y=gini)) + theme_minimal() +
  geom_point(data = df2, colour = "grey70", alpha=.4) +
  geom_point(alpha=.6, aes(colour = region_un)) + 
  facet_wrap(~region_un) +
  theme(axis.text.x = element_text(angle=45)) +
  theme(legend.position = c(0.8, 0.2)) +
  labs(title = "Gini Values Over Time",
       x = " Year",
       y = "Gini Coeff",
       color = "Region")
ggsave("Figs/gini_region_by_year.jpeg")
