#!/bin/sh
rm -rf bats-core
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh /usr/local