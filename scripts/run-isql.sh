#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';


example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo " roda-sql.sh <DATABASE_NAME>"
  echo
  echo " example:"
  echo "   sh /scripts/run-isql.sh /firebird/data/my_database.fdb"
  echo -e "==================================${COLOR_CLEAN}"
}

DATABASE_NAME=$1

if [ -z $DATABASE_NAME ]; then
  echo -e "${COLOR_RED}Error: Invalid parameters"
  example;
  exit 1;
fi

docker exec -ti firebird bash -c '/usr/local/firebird/bin/isql -u sysdba -p $ISC_PASSWORD '$DATABASE_NAME