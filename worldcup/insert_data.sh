#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams,games")

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
if [[ $winner != "winner" ]]
then 
  GetWinner=$($PSQL "select team_id from teams where name='$winner'")
  #insert team
  if [[ -z $GetWinner ]]
  then
    insert_team_result=$($PSQL "INSERT INTO teams(name) values('$winner')")
    if [[ $insert_team_result == "INSERT 0 1" ]]
    then 
      echo se inserto el team, $winner
    fi
  fi
  Getopponent=$($PSQL "select team_id from teams where name='$opponent'")
  #insert team
  if [[ -z $Getopponent ]]
  then 
    insert_team_result=$($PSQL "INSERT INTO teams(name) values('$opponent')")
    if [[ $insert_team_result == "INSERT 0 1" ]]
    then 
      echo se inserto el team, $opponent
    fi
  fi
fi
done

cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $winner != "winner" ]]
  then
  GetWinner=$($PSQL "select team_id from teams where name='$winner'")
  Getopponent=$($PSQL "select team_id from teams where name='$opponent'")
  insert_games=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals)
                                    values($year,'$round',$GetWinner,$Getopponent,$winner_goals,$opponent_goals)")
  echo $insert_games
  fi
done
