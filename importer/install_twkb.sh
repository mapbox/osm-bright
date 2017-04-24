#!/bin/bash

set -e

git clone --recursive https://github.com/rinigus/wkb2twkb-sqlite
(cd wkb2twkb-sqlite && make)
