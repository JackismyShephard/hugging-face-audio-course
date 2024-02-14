#!/bin/bash
# install cuda-12.1 system wide
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-12-1
rm -rf cuda-keyring_1.1-1_all.deb
# make and activate virtual environment
sudo apt install python3-venv
python3 -m venv .venv
source .venv/bin/activate
# install dependencies in virtual environment
pip install --upgrade pip
pip install -r requirements-frozen.txt
git clone https://github.com/NVIDIA/apex
sudo apt-get install ninja-build
cd apex
pip install -v --disable-pip-version-check --no-cache-dir --no-build-isolation \
    --config-settings "--build-option=--cpp_ext" --config-settings "--build-option=--cuda_ext" ./
cd ..
pip cache purge
