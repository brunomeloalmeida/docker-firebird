#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';


example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo " roda-sql.sh <DATABASE_PASSWORD> <DATABASE_NAME>"
  echo
  echo " example:"
  echo "   sh /scripts/roda-sql.sh senha_banco meu_banco.fdb"
  echo -e "==================================${COLOR_CLEAN}"
}

DATABASE_PASSWORD=$1
DATABASE_NAME=$2

if [ -z $DATABASE_NAME ] || [ -z $DATABASE_PASSWORD ]; then
  echo -e "${COLOR_RED}Erro: Parâmetros esperados inválidos"
  example;
  exit 1;
fi

docker exec -ti firebird /usr/local/firebird/bin/isql -u sysdba -p $DATABASE_PASSWORD /firebird/data/$DATABASE_NAME
