#!/bin/bash
# make and activate virtual environment
sudo apt update
sudo apt install python3-venv
python3 -m venv .venv --upgrade-deps
source .venv/bin/activate
# install dependencies in virtual environment
pip install -r requirements-frozen.txt
pip cache purge
