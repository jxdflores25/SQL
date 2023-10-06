#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

if [[ $1 =~ ^[0-9]+$ ]]
then  
#get element
  GET_ELEMENT=$($PSQL "select * from elements as a inner join properties as b using(atomic_number) inner join types as c using(type_id) where a.atomic_number=$1;")
else 
  GET_ELEMENT=$($PSQL "select * from elements as a inner join properties as b using(atomic_number) inner join types as c using(type_id) where a.symbol='$1' or a.name='$1';")
fi


if [[ -z $GET_ELEMENT ]]
then
  echo 'I could not find that element in the database.'
else
 echo "$GET_ELEMENT" | while IFS="|" read type_id  atomic_number  symbol  name  atomic_mass  melting  boiling  typename 
    do
      echo "The element with atomic number $atomic_number is $name ($symbol). It's a $typename, with a mass of $atomic_mass amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius."
    done
fi

