#!/bin/bash
# encoding:utf-8

readonly base_dir="/tmp/mps_codelab"
readonly file="$base_dir/$(date +%s).md"

mkdir $base_dir

cp codelab/chapters/*.png "$base_dir/."

cat codelab/INDEX.md > $file
cat codelab/chapters/*.md >> $file

/tmp/claat export -o docs/ $file
cp codelab/*.html docs/mps-codelab/

rm -r $base_dir
