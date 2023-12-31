#!/bin/bash -v

cd ~
git clone https://github.com/microsoft/vcpkg
sudo apt-get install build-essential tar curl zip unzip
./vcpkg/bootstrap-vcpkg.sh

echo "export VCPKG_ROOT=~/vcpkg" >> ~/.bashrc

sudo apt install clang
sudo apt install gdb
sudo apt install cmake
sudo apt install ninja-build

sudo apt install pkg-config # vcpkg boost
sudo apt install autoconf autoconf-archive # vcpkg boost
sudo apt install libxinerama-dev libxcursor-dev xorg-dev libglu1-mesa-dev pkg-config # vcpkg glfw3
