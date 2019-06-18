#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';


example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo " restore.sh <DATABASE_NAME> <DATABASE_BKP>"
  echo
  echo " example:"
  echo "   sh /scripts/restore.sh my_database.fdb my_database.fbk"
  echo -e "==================================${COLOR_CLEAN}"
}


DATABASE_NAME=$1
DATABASE_BKP=$2

if [ -z $DATABASE_NAME ] || [ -z $DATABASE_BKP ]; then
  echo -e "${COLOR_RED}Error: Invalid parameters"
  example;
  exit 1;
fi


if [ -f $DATABASE_NAME ]; then
	/usr/local/firebird/bin/gbak -rep -user sysdba -pas $ISC_PASSWORD -r -v -o $DATABASE_BKP $DATABASE_NAME
else
	/usr/local/firebird/bin/gbak -user sysdba -pas $ISC_PASSWORD -r -v -o $DATABASE_BKP $DATABASE_NAME
fi