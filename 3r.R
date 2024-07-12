# Function to calculate fine based on the number of days overdue
cal_fine <- function(days_overdue) {
  # If the book is overdue for 7 days or less, there is no fine
  if (days_overdue <= 7) {
    fine <- 0
  } 
  # If the book is overdue for more than 7 days but 30 days or less
  else if (days_overdue <= 30) {
    fine <- (days_overdue - 7) * 2  # Fixed fine per day after 7 days
  } 
  # If the book is overdue for more than 30 days, the fine is capped
  else {
    fine <- 50  # Maximum fine cap
  }
  return(fine)
}

# Input the number of days the book is overdue
days_overdue <- as.integer(readline("Enter the number of days overdue: "))

# Calculate the fine amount using the cal_fine function
fine_amt <- cal_fine(days_overdue)

# Display the fine amount
cat("Fine amount:", fine_amt, "\n")

# Display appropriate message based on the fine amount
if (fine_amt == 0) {
  cat("No fine. Thank you for returning the book on time!\n")
} else if (days_overdue > 30) {
  cat("Fine exceeds the maximum cap. Please contact the library.\n")
} else {
  cat("Please pay the fine within the specified period.\n")
}
