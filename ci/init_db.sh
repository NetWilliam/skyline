#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


DATABASE_NAME="xcf_mfarm_test_$USER"

mysql -uroot -hdevdb -e "DROP DATABASE IF EXISTS $DATABASE_NAME;"
mysql -uroot -hdevdb -e "CREATE DATABASE $DATABASE_NAME CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;"
mysql -uroot -hdevdb -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* to xcf@'%' IDENTIFIED BY 'xcf@xiachufang.com';"
mysql -uroot -hdevdb $DATABASE_NAME < $DIR/tables.sql
