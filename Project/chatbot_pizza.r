chatbot_pizza <- function() {
  print("What is your name?")
  user_name <- readLines("stdin", n = 1)
  cat("Hi!", user_name, " Welcome to Pizza data_camp")
  
  df_menu <- data.frame(
    id_item = c(1, 2, 3),
    menu_name = c("Quattro formaggi", "Napoletana", "Caprese pizza"),
    p_menu = c(199, 299, 399)
  )
  print(df_menu)
  
  while (TRUE) {
    print("You can select the ID menu and sizes pizza")
    choose_id_item <- readLines("stdin", n = 1)
    name_product <- df_menu$menu_name[df_menu$id_item == choose_id_item]
    price_product <- df_menu$p_menu[df_menu$id_item == choose_id_item]
    
    if (choose_id_item %in% 1:3) {
      print(paste("Okay, you choose", name_product, "Which size pizza do you want?"))
      break
    } else {
      print("Please try again")
    }
  }
  
  while (TRUE) {
    print(paste("Which size pizza do you want?"))
    size <- c("S", "M", "L")
    p_size <- c(0, 50, 70)
    size_df <- data.frame(size, p_size)
    print(size_df)
    size_pizza <- readLines("stdin", n = 1)
    
    if (size_pizza %in% size) {
      total_price <- price_product + p_size[size_pizza == size]
      print(paste("Total payments: ", total_price))
      break
    } else {
      print("Please try again!")
    }
  }
  
  print("Thank you for ordering pizza from Pizza data_camp!")
}

chatbot_pizza()
