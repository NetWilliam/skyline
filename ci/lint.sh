#!/usr/bin/env bash

set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "start to check code style"

echo "python code check start"
$DIR/lint_py.sh
echo "python code check end"

echo "check code style done"
