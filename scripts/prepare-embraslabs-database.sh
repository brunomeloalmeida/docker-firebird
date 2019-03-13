#!/bin/bash
DB_NAME=$1
docker exec -it sup-firebird-database /bin/bash /firebird/scripts/prepare-database.sh /firebird/base/$1
