# Load the dplyr package
library(dplyr)

# Create a sample data frame df1
df1 <- data.frame(
  ID = 1:5,
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Age = c(25, 30, 25, 30, 45),
  Score = c(88, 90, 85, 87, 89)
)

# Create another sample data frame df2
df2 <- data.frame(
  ID = 3:7,
  Salary = c(50000, 55000, 60000, 65000, 70000)
)

# i. Filter and Select
# Filter for Age > 30 and select columns 'Name' and 'Score'
result_filter_select <- df1 %>%
  filter(Age > 30) %>%
  select(Name, Score)

# ii. Mutate
# Add a new column 'AdjustedScore' that adds 5 to each 'Score'
result_mutate <- df1 %>%
  mutate(AdjustedScore = Score + 5)

# iii. Group and Summarize
# Group by 'Age' and calculate the average score for each age
result_group_summarize <- df1 %>%
  group_by(Age) %>%
  summarize(AverageScore = mean(Score))

# iv. Arrange
# Arrange the rows by 'Age' in descending order
result_arrange <- df1 %>%
  arrange(desc(Age))

# v. Join
# Perform an inner join on 'ID' between df1 and df2
result_join <- df1 %>%
  inner_join(df2, by = "ID")

# Output the results of each operation
print("Filtered and Selected:")
print(result_filter_select)
print("Mutated with Adjusted Score:")
print(result_mutate)
print("Grouped and Summarized:")
print(result_group_summarize)
print("Arranged by Age:")
print(result_arrange)
print("Joined on ID:")
print(result_join)
