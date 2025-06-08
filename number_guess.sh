#!/bin/bash

# PSQL variable for database queries
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
# Initialize number of guesses
NUMBER_OF_GUESSES=0

# Prompt for username
echo "Enter your username:"
read USERNAME

# Get user_id from the database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# If user doesn't exist
if [[ -z $USER_ID ]]
then
  # Welcome message for new user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user into the database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # Get the new user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  # Get user's game statistics
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  # Welcome message for returning user
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Game loop
echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS
  # Increment number of guesses
  ((NUMBER_OF_GUESSES++))

  # Check if the guess is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Check if the guess is correct
  if (( GUESS == SECRET_NUMBER ))
  then
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    # Insert game result into the database
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
    exit
  elif (( GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
  echo "# Added user input prompt" 
done
