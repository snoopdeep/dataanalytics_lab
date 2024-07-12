# Declare constants for the number of students and the number of courses
num_students <- 5
num_courses <- 5

# List of student names
student_names <- c("A", "B", "C", "D", "E")

# Matrix of course marks for each student (each row represents a student)
course_marks <- matrix(c(
  85, 92, 78, 88, 95,
  75, 80, 85, 70, 60,
  100, 78, 56, 34, 56,
  78, 45, 67, 89, 90,
  89, 80, 67, 78, 90
), nrow = num_students, byrow = TRUE)

# Initialize an empty list to store student records
student_records <- list()

# Loop through each student to calculate their total marks, average marks, and grade
for (i in 1:num_students) {
  name <- student_names[i]          # Get the student's name
  marks <- course_marks[i, ]        # Get the student's marks for all courses
  total_marks <- sum(marks)         # Calculate the total marks
  avg_marks <- total_marks / num_courses  # Calculate the average marks
  
  # Determine the grade based on the average marks
  grade <- if (avg_marks >= 90) {
    "A"
  } else if (avg_marks >= 70) {
    "B"
  } else {
    "C"
  }
  
  # Create a list to store the student's information
  student_record <- list(
    name = name,
    marks = marks,
    total = total_marks,
    average = avg_marks,
    grade = grade
  )
  
  # Add the student's record to the student_records list
  # student_records[[i]] <- student_record
  student_records<-c(student_records,list(student_record))
}

# Display the student information
cat("\nStudent Grade Report:\n")
for (student_record in student_records) {
  cat("\nName:", student_record$name, "\n")
  cat("Marks:", student_record$marks, "\n")
  cat("Total Marks:", student_record$total, "\n")
  cat("Average Marks:", student_record$average, "\n")
  cat("Grade:", student_record$grade, "\n")
}
