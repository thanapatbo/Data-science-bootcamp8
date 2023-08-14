play_game <- function() {
  moves <- c("r", "s", "p", "quit")
  win <- 0
  loss <- 0
  tie <- 0
  total_round <- 1

  cat("Let's play game RSP datacamp_08\n")
  while(TRUE) {
    cat("Enter your move : Rock(r), Scissors(s), Paper(p) or quit\n")
    player_move <- readLines("stdin", n = 1)
    if (player_move == "quit") {
      cat("Good bye!\n")
      break
    }
    player_move <- tolower(player_move)
    com_move <- sample(moves, 1)
    if (player_move == com_move) {
      cat("Tie!\n")
      tie <- tie +1
    } else if (player_move == "r" && com_move == "s" ||
      player_move == "s" && com_move == "p" ||
      player_move == "p" && com_move == "r") {
      cat("You Win!\n")
      win <- win + 1
    } else {
      cat("You Loss!")
      loss <- loss + 1
    } 
    total_round <- total_round + 1
    }
  cat("Wins:", win, "Losses:", loss, "Ties:", tie, "\n")
}

play_game()
