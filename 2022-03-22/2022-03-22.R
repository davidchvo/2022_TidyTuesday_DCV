##### Tidy Tuesday ####
##### 2022-03-22   ####

library(tidytuesdayR)
library(tidyverse)
library(here)

# download data
tuesdata <- tidytuesdayR::tt_load('2022-03-22')
# split dataframes
for (i in 1:length(tuesdata)) {
  assign(names(tuesdata)[i], tuesdata[[i]])
}

lifetables %>% 
  mutate(age_class = cut(x, breaks = seq(0, max(x)+1, by = 10 ), include.lowest = TRUE ) ) %>%
  group_by(age_class) %>%
  summarise(xbar = mean(x), lx = max(lx) )


ggplot(data = lifetables, aes(group = year)) +
  geom_line(aes(x = x, y = qx, color = year)) +
  coord_cartesian(xlim = c(0,101),
                  ylim = c(0,0.025))
  
ggplot(data = applicants, aes(group = sex)) +
  geom_line(aes(x = year, y = n_all, color = sex))
