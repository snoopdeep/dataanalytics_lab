# Load the 'dplyr' package for data manipulation
library(dplyr)

# Create a data frame to store student information
# An empty data frame is created to store student information.
student_data <- data.frame(
  Name = character(),
  Math_Score = numeric(),
  Science_Score = numeric(),
  History_Score = numeric(),
  Attendance = numeric()
)

# Function to add student information
add_student <- function(name, math_score, science_score, history_score, attendance) {
  new_student <- data.frame(
    Name = name,
    Math_Score = math_score,
    Science_Score = science_score,
    History_Score = history_score,
    Attendance = attendance
  )
  student_data <<- bind_rows(student_data, new_student)
  cat("Student information added.\n")
}

# Function to calculate average scores
calculate_average_scores <- function() {
  avg_scores <- student_data %>%
    mutate(Average_Score = (Math_Score + Science_Score + History_Score) / 3) %>%
    select(Name, Average_Score)
  return(avg_scores)
}

# Function to identify students with low attendance
identify_low_attendance <- function(threshold) {
  low_attendance <- student_data %>%
    filter(Attendance < threshold) %>%
    select(Name, Attendance)
  return(low_attendance)
}

# Function to generate a performance report
generate_report <- function() {
  avg_scores <- calculate_average_scores()
  low_attendance <- identify_low_attendance(70)
  report <- merge(avg_scores, low_attendance, by = "Name", all = TRUE)
  cat("Performance Report:\n")
  print(report)
}

# Main program loop
repeat {
  cat("\n1. Add Student\n2. Generate Report\n3. Exit\n")
  choice <- as.integer(readline("Enter your choice: "))
  
  if (choice == 1) {
    name <- readline("Enter student name: ")
    math_score <- as.numeric(readline("Enter math score: "))
    science_score <- as.numeric(readline("Enter science score: "))
    history_score <- as.numeric(readline("Enter history score: "))
    attendance <- as.numeric(readline("Enter attendance percentage: "))
    add_student(name, math_score, science_score, history_score, attendance)
  } else if (choice == 2) {
    generate_report()
  } else if (choice == 3) {
    cat("Exiting the program. Goodbye!\n")
    break
  } else {
    cat("Invalid choice. Please try again.\n")
  }
}

# Note: %>% is known is pipe operation in R. 
# The %>% operator takes the output of the left-hand side expression and passes it as the first argument 
#to the function on the right-hand side. This allows for a cleaner and more readable code structure, especially 
# when performing a series of data manipulations.
