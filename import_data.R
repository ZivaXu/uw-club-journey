#data sets

clubs <- read.csv("data/Club_List.csv", stringsAsFactors = FALSE)

all_clubs <- clubs %>% 
  select(Club_Name, Contact_Email)

starred_clubs <- clubs %>% 
  filter(Starred == "Yes") %>% 
  select(Club_Name, Contact_Email)

top_20 <- head(clubs[order(clubs$Task_Counts, decreasing= T),], n = 20)
  
task_counts <- top_20 %>% 
  select(Club_Name, Task_Counts)
  
