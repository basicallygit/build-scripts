#!/bin/sh

git clone https://github.com/basicallygit/$1

mkdir $1-binaries

cd $1

# Build dynamically linked binary
cargo build --release
# Build statically linked binary
cargo build --release --target=x86_64-unknown-linux-musl 

mv target/release/$1 ../$1-binaries/$1
mv target/x86_64-unknown-linux-musl/release/$1 ../$1-binaries/$1-musl

# Strip the binaries of any unnecessary symbols 
strip ../$1-binaries/$1*

cd ..
rm -rf $1
