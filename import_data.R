#data sets

clubs <- read.csv("data/Club_List.csv", stringsAsFactors = FALSE)

all_clubs <- clubs %>% 
  select(Club_Name, Contact_Email)

starred_clubs <- clubs %>% 
  filter(Starred == "Yes") %>% 
  select(Club_Name, Contact_Email)