#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';


example() {
  echo -e "${COLOR_DARK_GRAY}=================================="
  echo "How to use it:"
  echo " backup.sh <DATABASE_NAME> <DATABASE_BKP>"
  echo
  echo " example:"
  echo "   sh /scripts/backup.sh meu_banco.fdb meu_banco.fbk"
  echo -e "==================================${COLOR_CLEAN}"
}


DATABASE_NAME=$1
DATABASE_BKP=$2

if [ -z $DATABASE_NAME ] || [ -z $DATABASE_BKP ]; then
  echo -e "${COLOR_RED}Erro: Parâmetros esperados inválidos"
  example;
  exit 1;
fi

/usr/local/firebird/bin/gbak -user $FIREBIRD_USER -pas $ISC_PASSWORD -b -v $DATABASE_NAME $DATABASE_BKP
