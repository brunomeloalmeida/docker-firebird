#!/bin/bash
$DATABASE_NAME=$1
/usr/local/firebird/bin/isql -u sysdba -p $ISC_PASSWORD /firebird/data/$DATABASE_NAME
