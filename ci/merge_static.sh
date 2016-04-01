#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PATH="$HOME/miniconda/bin:$PATH"
export PYTHONPATH="$DIR/..:$PYTHONPATH"
export XCF_APP_CONFIG="myconf.stage_config"


# Skip merge static if no static file changed
# If git repo doesn't exist, then merge static anyway

if [[ -e $DIR/../.git ]]; then
    COUNT_STATIC_FILES=`git diff --name-status master | grep -E '^(A|M).+(/static/|myfile/(js|css|entry)|webpack_config/)' | wc -l`
    if [[ $COUNT_STATIC_FILES -eq 0 ]]; then
        echo 'no static file changed, skip merge static'
        exit 0
    fi
else
    echo 'no git repo, merge static anyway'
fi


# Activate Python environment

source activate xcf


# Run static merging

cd $DIR/../
./merge_static
