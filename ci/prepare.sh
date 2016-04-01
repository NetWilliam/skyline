#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export PATH="$HOME/miniconda/bin:$PATH"
export PYTHONPATH="$DIR/..:$PYTHONPATH"


# Create logs directories

sudo mkdir -m 755 -p /var/log/xcf
for f in ad ec newage openapi supervisor spam_log search image_service; do
    sudo mkdir -m 755 -p /var/log/xcf/$f
done
sudo chmod -R 777 /var/log/xcf


# Create /mfs directory

sudo mkdir -m 755 -p /mfs
sudo chmod -R 777 /mfs


# Update environment if cache is available
if [[ -e $HOME/miniconda/bin/conda ]]; then
    conda env update -f $DIR/../environment.yml

# Otherwise, install conda and create environment
else
    wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -f -p $HOME/miniconda
    conda env create -f $DIR/../environment.yml
fi
