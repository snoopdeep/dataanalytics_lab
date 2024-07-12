# Define a list of products, each represented as a list with keys: "name" and "price"
products <- list(
  list(name = "A", price = 10),
  list(name = "B", price = 20),
  list(name = "C", price = 30),
  list(name = "D", price = 40)
)

# Define a list of items to add to the cart, with each item having a "name" and "quantity"
cart_items_to_add <- list(
  list(name = "A", quantity = 2),
  list(name = "D", quantity = 3)
)

# Initialize an empty list to hold the items in the shopping cart
shopping_cart <- list()

# Loop through each item in the cart_items_to_add list
for (item in cart_items_to_add) {
  product_name <- item$name  # Get the product name from the cart item
  quantity <- item$quantity  # Get the quantity from the cart item
  
  # Find the product in the products list by matching the name
  product <- NULL
  for (p in products) {
    if (p$name == product_name) {
      product <- p  # Store the product details if found
      break
    }
  }
  32
  # If the product was found, add it to the shopping cart
  if (!is.null(product)) {
    cart_item <- list(name = product_name, price = product$price, quantity = quantity)
    shopping_cart <- c(shopping_cart, list(cart_item))  # Add the item to the shopping cart
    cat("Item added to the cart\n")
  } else {
    cat("Product not found.\n")
  }
}

# Initialize a variable to hold the subtotal (total cost before tax)
subtotal <- 0

# Print the receipt header
cat("\nReceipt\n")

# Loop through each item in the shopping cart to print details and calculate the subtotal
for (item in shopping_cart) {
  item_subtotal <- item$price * item$quantity  # Calculate the subtotal for the item
  cat("Name:", item$name, "Price:", item$price, "Quantity:", item$quantity, "Subtotal:", item_subtotal, "\n")
  subtotal <- subtotal + item_subtotal  # Add the item subtotal to the overall subtotal
}

# Print the total cost before tax
cat("\nSubtotal:", subtotal, "\n")

# Define the tax rate (e.g., 8%)
tax_rate <- 0.08

# Calculate the tax amount
tax_amount <- subtotal * tax_rate

# Calculate the final total cost by adding the tax amount to the subtotal
total_cost <- subtotal + tax_amount

# Print the tax amount and the final total cost
cat("Tax (8%):", round(tax_amount, 2), "\n")
cat("Total Cost:", round(total_cost, 2), "\n")
