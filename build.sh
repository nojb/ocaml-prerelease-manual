#!/bin/bash

set -eox pipefail

sudo apt-get update -y
sudo apt-get install -y texlive-latex-extra texlive-fonts-recommended texlive-lualatex hevea sass

git clone https://github.com/ocaml/ocaml

cd ocaml

./configure --prefix $(pwd)/local

make -j
make -C manual/src/html_processing duniverse
make -C manual web DISCLAIMER=1

cd -

git checkout -b gh-pages

git rm '*'

cp -R ocaml/manual/src/webman/*/* .

rm -rf ocaml

git add .

git commit -m 'foo'

git push origin gh-pages
