#!/bin/bash

set -eox pipefail

git clone https://github.com/ocaml/ocaml ../ocaml

cd ../ocaml

./configure --prefix $(pwd)/local

make -j && make -j -C manual web

cd -

git checkout --orphan gh-pages

git rm '*'

cp -R manual/src/webman/*/* .
