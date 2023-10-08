#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

#GET USERNAME 
DISPLAY(){
GET_ID_USER=$($PSQL "select user_id from users where username='$USERNAME'")

if [[ -z $GET_ID_USER ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  #ADD NEW USER
  ADD_USER=$($PSQL "insert into users(username) values('$USERNAME')")
else
  GET_GAME=$($PSQL "select count(user_id),min(number_of_attemps) from games where user_id=$GET_ID_USER")
  echo "$GET_GAME" | while IFS="|" read  games_played best_game
  do 
    echo "Welcome back, $USERNAME! You have played $games_played games, and your best game took $best_game guesses."
  done
fi

GAME
}

GAME(){
RANDON_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"
read NUMBER

CONTADOR=0

while true
do 
  if [[ $NUMBER =~ ^[0-9]+$ ]]
    then
    let CONTADOR++
    if [[ $NUMBER > $RANDON_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi

    if [[ $NUMBER < $RANDON_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi

    if [[ $NUMBER = $RANDON_NUMBER ]]
    then 
      GET_ID=$($PSQL "select user_id from users where username='$USERNAME'")
      INSERT_GAME=$($PSQL "insert into games(user_id,number_of_attemps) values($GET_ID,$CONTADOR)")
      break
    fi
    echo "Guess the secret number between 1 and 1000:"
    read NUMBER
  else
    echo "That is not an integer, guess again:"
    read NUMBER
  fi
done 

echo "You guessed it in $CONTADOR tries. The secret number was $RANDON_NUMBER. Nice job!"
exit
}

DISPLAY
