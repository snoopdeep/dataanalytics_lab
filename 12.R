# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)

# Task 1: Data Overview and Structure
# Read the dataset
ipl_data <- read_csv("ipl_data.csv")

# Display the structure of the dataset
str(ipl_data)

# Output summary statistics of numerical columns
summary(ipl_data)

# Task 2: Basic Data Insights
# Total number of matches in the dataset
total_matches <- nrow(ipl_data)
cat("Total number of matches:", total_matches, "\n")

# Number of unique teams
unique_teams <- unique(c(ipl_data$Team1, ipl_data$Team2))
cat("Unique teams:", length(unique_teams), "\n")
print(unique_teams)

# Task 3: Team Performance Analysis
# Number of matches won by each team
matches_won_by_team <- ipl_data %>%
  group_by(Winner) %>%
  summarise(Count = n())
print(matches_won_by_team)
# Compute the average total runs scored in the matches
average_runs <- mean(ipl_data$Total.Runs, na.rm = TRUE)

# Compute the average total wickets taken in the matches
average_wickets <- mean(ipl_data$Total.Wickets, na.rm = TRUE)

cat("Average total runs scored:", average_runs, "\n")
cat("Average total wickets taken:", average_wickets, "\n")

# Task 4: Venue Insights
# Most frequently used venue for matches
most_frequent_venue <- ipl_data %>%
  group_by(Venue) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  slice(1) %>%
  pull(Venue)

cat("Most frequently used venue:", most_frequent_venue, "\n")

# Task 5: Visualization
# Bar plot to visualize the number of matches won by each team
ggplot(matches_won_by_team, aes(x = Winner, y = Count, fill = Winner)) +
  geom_bar(stat = "identity") +
  labs(title = "Number of Matches Won by Each Team",
       x = "Team",
       y = "Matches Won")


