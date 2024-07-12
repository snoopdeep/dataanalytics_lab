# Load necessary library
# install.packages("gridExtra")
library(ggplot2)

# Prepare example data
data <- data.frame(
  StudentName = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Score = c(88, 72, 90, 65, 87),
  Attendance = c(95, 80, 88, 75, 92),
  Time = c(1, 2, 3, 4, 5)  # Simulating the collection of scores over time
)

# Scatter plot to visualize the relationship between scores and attendance percentages
scatter_plot <- ggplot(data, aes(x = Attendance, y = Score)) +
  geom_point(color = "blue") +
  labs(title = "Relationship Between Attendance and Scores", x = "Attendance (%)", y = "Score")

# Bar plot to show the distribution of scores among different students
bar_plot <- ggplot(data, aes(x = StudentName, y = Score, fill = StudentName)) +
  geom_bar(stat = "identity", color = "black") + # The stat = "identity" tells ggplot that the y-values provided (scores) should be used directly as bar heights.
  labs(title = "Scores Distribution Among Students", x = "Student Name", y = "Score")

# Line plot to display the trend of scores over time
line_plot <- ggplot(data, aes(x = Time, y = Score, group = 1)) +
  geom_line(color = "green") +
  geom_point(color = "red") +
  labs(title = "Trend of Scores Over Time", x = "Time (Intervals)", y = "Score")

# Histogram to visualize the distribution of scores
histogram <- ggplot(data, aes(x = Score)) +
  geom_histogram(bins  = 5, fill = "orange", color = "black") +
  labs(title = "Histogram of Scores", x = "Score", y = "Frequency")

# Arrange the plots
# print(scatter_plot)
# # print(bar_plot)
# # print(line_plot)
# # print(histogram)
library(gridExtra)
grid.arrange(scatter_plot, bar_plot, line_plot, histogram, ncol = 2)
