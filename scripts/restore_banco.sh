#!/bin/bash

USER=SYSDBA
PASSWORD=wildfire
FILE_FBK=$1
FILE_FDB=$2

docker-compose exec firebird /usr/local/firebird/bin/gbak -rep -user $USER -pas $PASSWORD -r -v -o /firebird/backups/$FILE_FBK /firebird/data/$FILE_FDB
