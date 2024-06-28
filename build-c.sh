#!/bin/sh

git clone https://github.com/basicallygit/$1

mkdir $1-binaries

cd $1

# Build binary from makefile
make

binary_path=""

# Assume binary is ./PROJECT_NAME, ./bin/PROJECT_NAME or ./out/PROJECT_NAME
if [ -f $1 ]; then
    binary_path="$1"
elif [ -f ./bin/$1 ]; then
    binary_path="./bin/$1"
elif [ -f ./out/$1 ]; then
    binary_path="./out/$1"
else
    echo "Cannot find binary. exiting."
    exit
fi

mv $binary_path ../$1-binaries/

# Strip the binary
strip ../$1-binaries/$1

cd ..
rm -rf $1
