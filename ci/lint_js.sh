#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR=`dirname $DIR`

cd $REPO_DIR

npm test -s -- .
