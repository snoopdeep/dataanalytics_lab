# Task 1: Load the Dataset
# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)

# Read the dataset
purchase_data <- read_csv("customer_purchases.csv")

# Task 2: Data Summary
# Total number of records
total_records <- nrow(purchase_data)
cat("Total number of records:", total_records, "\n")

# Total number of unique customers
total_unique_customers <- purchase_data %>%
  distinct(Customer_ID) %>%
  nrow()
cat("Total number of unique customers:", total_unique_customers, "\n")

# Task 3: Calculate Statistical Measures
# Mean purchase amount
mean_purchase <- mean(purchase_data$Purchase_Amount, na.rm = TRUE) # "NA remove". 
cat("Mean purchase amount:", mean_purchase, "\n")

# Median purchase amount
median_purchase <- median(purchase_data$Purchase_Amount, na.rm = TRUE)
cat("Median purchase amount:", median_purchase, "\n")

# Standard deviation of purchase amounts
sd_purchase <- sd(purchase_data$Purchase_Amount, na.rm = TRUE)
cat("Standard deviation of purchase amounts:", sd_purchase, "\n")

# Task 4: Customer Segmentation
# Create a new column 'Segment'
purchase_data <- purchase_data %>%
  mutate(Segment = if_else(Purchase_Amount < median_purchase, "Low Spender", "High Spender"))

# Task 5: Visualize Data
# Histogram of purchase amounts
hist_plot <- ggplot(purchase_data, aes(x = Purchase_Amount)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black") +
  labs(title = "Distribution of Purchase Amounts",
       x = "Purchase Amount",
       y = "Frequency")

# Display the plot
print(hist_plot)


#NOTE:
# Check current working directory
#getwd()
