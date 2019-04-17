#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_GREEN='\033[1;32m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';

print() {
  echo
  echo -e "${COLOR_YELLOW}$@${COLOR_CLEAN}"
}

REGEX_GET_OPTION="^--quiet\b"
validateParams() {
  if [ -z $1 ] || [ ! -z $(echo "$1" | egrep -io $REGEX_GET_OPTION) ]; then
    echo -e "${COLOR_RED}Error: Missing database name${COLOR_CLEAN}"
    exit 1
  fi
}
validateParams $@
OPTION_QUIET=$( [ $# -eq 2 ] && echo $2 | egrep -io $REGEX_GET_OPTION )

DB_NAME=/firebird/data/${1/.fdb/}.fdb
if [ -f $DB_NAME ]; then
  # Permit new connections
  print "/usr/local/firebird/bin/gfix  -user SYSDBA -password $ISC_PASSWORD -online $DB_NAME || exit 1"
  /usr/local/firebird/bin/gfix  -user SYSDBA -password $ISC_PASSWORD -online $DB_NAME || exit 1
  echo "success"
else
  echo -e $COLOR_RED"database '$DB_NAME' not found"
fi

[ -z $OPTION_QUIET ] && echo && echo -e "${COLOR_GREEN}success - $0 ${COLOR_CLEAN}" || echo