# Initialize arrays for inventory items and quantities
inventory_items <- character(0)
inventory_quantities <- numeric(0)

# Function to add a new item with quantity
add_item <- function(item, quantity) {
  inventory_items <<- c(inventory_items, item)
  inventory_quantities <<- c(inventory_quantities, quantity)
  cat("Item added: ", item, " with quantity ", quantity, "\n")
}

# Function to update quantity of an existing item
update_quantity <- function(item, new_quantity) {
  if (item %in% inventory_items) {
    index <- which(inventory_items == item)
    inventory_quantities[index] <<- new_quantity
    cat("Updated ", item, " to quantity ", new_quantity, "\n")
  } else {
    cat("Item not found.\n")
  }
}

# Function to display inventory
display_inventory <- function() {
  cat("\nInventory List:\n")
  if (length(inventory_items) > 0) {
    for (i in seq_along(inventory_items)) {
      cat(inventory_items[i], ": ", inventory_quantities[i], "\n")
    }
  } else {
    cat("No items in inventory.\n")
  }
}

# Main interaction loop
repeat {
  cat("\nOptions:\n1. Add Item\n2. Update Quantity\n3. Display Inventory\n4. Exit\n")
  choice <- as.integer(readline("Choose an option: \n"))
  
  if (choice == 1) {
    item <- readline("Enter item name: ")
    quantity <- as.integer(readline("Enter quantity: "))
    add_item(item, quantity)
  } else if (choice == 2) {
    item <- readline("Enter item name: ")
    new_quantity <- as.integer(readline("Enter new quantity: "))
    update_quantity(item, new_quantity)
  } else if (choice == 3) {
    display_inventory()
  } else if (choice == 4) {
    cat("Exiting the program.\n")
    break
  } else {
    cat("Invalid option, try again.\n")
  }
}

