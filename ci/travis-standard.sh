#!/bin/bash
set -e

# Setup
ci/travis-setup.sh

# Check standard tests standard build
make check

# Check that different calls to make work
make distcheck

# Check standard tests with assertions on
make clean
./configure --enable-debug
make check

# Check standard tests with assertions off
make clean
./configure --disable-debug
make check
