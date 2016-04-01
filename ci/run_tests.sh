#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PATH="$HOME/miniconda/bin:$PATH"
export PYTHONPATH="$DIR/..:$PYTHONPATH"
export XCF_APP_CONFIG="myconf.test_config"


# Skip tests if no .py file changed
# If git repo doesn't exist, then run tests anyway

if [[ -e $DIR/../.git ]]; then
    COUNT_PY_FILES=`git diff --name-status master | grep -E '^(A|M).+\.py$' | wc -l`
    if [[ $COUNT_PY_FILES -eq 0 ]]; then
    	echo 'no py file changed, skip tests'
    	exit 0
    fi
else
    echo 'no git repo, run tests anyway'
fi


# Activate Python environment

source activate xcf


# Init DB

echo 'init db...'

$DIR/init_db.sh

echo 'init db...done'

# Run tests

py.test -x -vv -s $DIR/../ec/tests/
py.test -x -vv -s $DIR/../mysite/tests/
py.test -x -vv -s $DIR/../openapi/tests/

# Clean up DB

echo 'clean up...'

mysql -uroot -hdevdb -e "DROP DATABASE IF EXISTS xcf_mfarm_test_$USER;"

echo 'clean up...done'
