#!/bin/bash
# number_guess.sh - FreeCodeCamp relational DB Bash project

# ---------- PSQL helper ----------
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# ---------- 1. Ask for username ----------
echo "Enter your username:"
read USERNAME

# Trim possible leading/trailing spaces
USERNAME="$(echo "$USERNAME" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')"

# Look up user
USER_ROW="$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME';")"

# If new player
if [[ -z $USER_ROW ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user row
  INSERT_RESULT="$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")"
  USER_ID="$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")"
  GAMES_PLAYED=0
  BEST_GAME=NULL
else
  # Existing user -> parse the row
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<<"$USER_ROW"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# ---------- 2. Generate secret number ----------
SECRET_NUM=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"
NUM_GUESSES=0

# ---------- 3. Main guessing loop ----------
while true
do
  read GUESS
  # Validate integer (regex ^-?[0-9]+$ but only positive allowed here)
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  (( NUM_GUESSES++ ))

  if (( GUESS == SECRET_NUM ))
  then
    break
  elif (( GUESS > SECRET_NUM ))
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# ---------- 4. Game won – report & update DB ----------
echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUM. Nice job!"

# Update stats
NEW_GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))

# Calculate new best_game if applicable
if [[ -z $BEST_GAME || $NUM_GUESSES -lt $BEST_GAME ]]
then
  NEW_BEST=$NUM_GUESSES
else
  NEW_BEST=$BEST_GAME
fi

$PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$NEW_BEST WHERE user_id=$USER_ID;"
