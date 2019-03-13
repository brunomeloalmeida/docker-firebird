#!/bin/bash
# Example:
#   DATABASE_NAME=/firebird/data/staging.fdb
#   DATABASE_NAME=/firebird/backup/embraslabs.fdb

DATABASE_NAME=$1

echo "Force shutdown on database $DATABASE_NAME"
/usr/local/firebird/bin/gfix -user SYSDBA -pas wildfire -online $DATABASE_NAME
/usr/local/firebird/bin/gfix -user SYSDBA -pas wildfire -shut -force 5 $DATABASE_NAME

echo
echo "Excluindo registros que não pertencem ao Suprimentos"
/usr/local/firebird/bin/isql -u sysdba -p wildfire $DATABASE_NAME -i /firebird/scripts/files/delete-registers.sql


BKP_PATH=/backup
BKP_DATABASE=$BKP_PATH/$( date +%Y%m%d%H%M%S ).fbk

mkdir $BKP_PATH
echo
echo "Criando backup"
/usr/local/firebird/bin/gbak -user SYSDBA -pas wildfire -b -v $DATABASE_NAME $BKP_DATABASE
rm -Rf $DATABASE_NAME

/usr/local/firebird/bin/gbak -rep -user SYSDBA -pas wildfire -r -v -o $BKP_DATABASE $DATABASE_NAME
rm -Rf $BKP_DATABASE
