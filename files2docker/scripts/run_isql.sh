#!/bin/bash

COLOR_RED='\033[1;31m';
COLOR_GREEN='\033[1;32m';
COLOR_BLUE='\033[1;36m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';

print() {
  echo
  echo -e "${COLOR_YELLOW}$@${COLOR_CLEAN}"
}

example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo " run_isql.sh <DATABASE_NAME>"
  echo
  echo " example:"
  echo "   sh /scripts/run_isql.sh my_database.fdb"
  echo -e "==================================${COLOR_CLEAN}"
}

# Variaveis
DATABASE_NAME=$1

validateParams() {
  if [ -z $DATABASE_NAME ]; then
    echo -e "${COLOR_RED}Error: Invalid parameters"
    example;
    exit 1;
  fi
}
validateParams

/usr/local/firebird/bin/isql -user sysdba -pas $ISC_PASSWORD /firebird/data/$DATABASE_NAME
