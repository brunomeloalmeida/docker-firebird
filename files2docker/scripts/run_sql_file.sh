#!/bin/bash

COLOR_RED='\033[1;31m';
COLOR_GREEN='\033[1;32m';
COLOR_BLUE='\033[1;36m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_CLEAN='\033[0m';

print() {
  echo
  echo -e "${COLOR_YELLOW}$@${COLOR_CLEAN}"
}

example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo " run_sql_file.sh <SQL_FILE> <DATABASE_NAME>"
  echo
  echo " example:"
  echo "   sh /scripts/run_sql_file.sh limabanco.sql my_database.fdb"
  echo -e "==================================${COLOR_CLEAN}"
}

# Variaveis
SQL_FILE=$1
DATABASE_NAME=$2

if [ -z $DATABASE_NAME ] || [ -z $SQL_FILE ]; then
  echo -e "${COLOR_RED}Error: Invalid parameters"
  example;
  exit 1;
fi

print "/usr/local/firebird/bin/isql -user sysdba -pas $ISC_PASSWORD -i $SQL_FILE /firebird/data/$DATABASE_NAME"

/usr/local/firebird/bin/isql -user sysdba -pas $ISC_PASSWORD -i $SQL_FILE /firebird/data/$DATABASE_NAME