#!/bin/sh

source $(dirname $(realpath ${BASH_SOURCE[0]}))/utils/repository/git.sh

pushd scripts
git_change_author_info_by_email "gbesancon@slb.com" "gilles.besancon@gmail.com" "Gilles Besançon"
git_change_author_info_by_name "Gilles Besancon" "gilles.besancon@gmail.com" "Gilles Besançon"
popd

git_change_author_info_by_email "gbesancon@slb.com" "gilles.besancon@gmail.com" "Gilles Besançon"
git_change_author_info_by_name "Gilles Besancon" "gilles.besancon@gmail.com" "Gilles Besançon"
git add scripts