# Wins Counter
Wins <- 0
Losses <- 0

# Select Doors
doors <- c(1, 2, 3)
answer <- "nothing"
prize <- "nothing"  # no prize yet
game <- "start"


while (game == "start") {
  x = 0
  # Select first door
  x <- readline("Pick a door 1,2, or 3 \n")
  car_door <- sample(doors, 1)  # sets door with car
  goat_door <- setdiff(doors, car_door)  # sets doors with goats
  # Doors that remain
  remain <- setdiff(doors, x)
  if(x != 0 | x != "" | !is.na(x)){
    game <- "firstdoor"
    
  }
}

while (game == "firstdoor" & !is.na(x)) {
  # Select car door
  if (x == car_door) {
    cat("You picked the door with a car behind it! \n")
    answer <- readline("Would you like to switch? (Yes/No) \n")
    
    # If user wishes to switch
    if (answer == "Yes") {
    #  newdoor <- readline("Pick a door -->", (remain), "\n") # pick door from remaining
      cat("Pick a new door ")
      newdoor <- readLines(remain, "\n")
      
      if (newdoor == car_door){
        cat("You picked the door with a car behind it! \n")
        prize <- "car"  # if car is door is selected
        game <- "end"
      } else {
        cat("You picked the door with a goat behind it! \n")
        prize <- "goat"  # goat door is selected
        game <- "end"
      }
    }
    # User does not wish to switch
    else if (answer == "No") {
      prize <- "car"
      cat("You won a car! \n")
      game <- "end"
    } else {
      answer <- readline("Invalid response, please use Yes or No \n")
    }
    
  } else {  # goat door was selected
    cat("You picked the door with a goat behind it! \n")
    answer <- readline("Would you like to switch? (Yes/No) \n")
    
    # If user wishes to switch
    if (answer == "Yes") {
      newdoor <- readline("Pick a door -->", remain)  # pick door from remaining
      if (newdoor == car_door) {
        cat("You picked the door with a car behind it! \n")
        prize <- "car"  # if car is door is selected
        game <- "end"
      } else {
        cat("You picked the door with a goat behind it! \n")
        prize <- "goat"  # goat door is selected
        game <- "end"
      }
      
    }
  }
}

while (game == "end") {
  if (prize == "car") {
    cat("You won a ", prize)
    Wins <- Wins + 1
    game <- "start"
  }
  
  if (prize == "goat") {
    cat("You lost and recieved a", prize)
    Losses <- Losses + 1
    game <- "start"
  }
}