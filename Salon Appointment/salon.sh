#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only  -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

#GetServices
echo -e "Welcome to My Salon, how can I help you?\n"

SERVICES_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "select * from services")

  if [[ $SERVICES != "service_id" ]]
  then 
    echo "$SERVICES" | while read SERVICE_ID BAR NAME
      do
        echo "$SERVICE_ID) $NAME"
      done
    #INSERT_SERVICES
    read SERVICE_ID_SELECTED

    #VERIFICAR SI ES CORRECTO EL SERVICIO
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      SERVICES_MENU "I could not find that service. What would you like today?"
    else 
      SERVICE_NAME=$($PSQL "select name from services where service_id='$SERVICE_ID_SELECTED'")
      if [[ -z $SERVICE_NAME ]]
      then
        SERVICES_MENU "I could not find that service. What would you like today?" 
      else
        #INSERT_NUMBER_PHONE
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        #VERIFICAR_NUMBER_PHONE
        CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
        if [[ -z $CUSTOMER_NAME ]]
        then 
          #INSERT_NAME
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME

          #INSERT_NEW_CUSTOMER
          INSERT_NEW_CUSTOMER=$($PSQL "insert into customers(name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")         
        fi

        #getcustomerid

        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

        #INSERT_SERVICE_TIME
        echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
        read SERVICE_TIME

        #INSERT_APPOINTMENT
        INSERT_APPOINTMENT=$($PSQL "insert into appointments(customer_id,service_id,time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")

        if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
        then

          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

        fi

      fi
    fi
    
  fi
}

SERVICES_MENU
