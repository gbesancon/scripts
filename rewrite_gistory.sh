#!/bin/sh

source $(dirname $(realpath ${BASH_SOURCE[0]}))/utils/repository/git.sh

EMAIL="gilles.besancon@gmail.com"
NAME="Gilles Besançon"

pushd scripts
git_change_author_info_by_email "GBesancon@slb.com" "$EMAIL" "$NAME"
git_change_author_info_by_email "gbesancon@slb.com" "$EMAIL" "$NAME"
git_change_author_info_by_name "Gilles Besancon" "$EMAIL" "$NAME"
popd

git_change_author_info_by_email "GBesancon@slb.com" "$EMAIL" "$NAME"
git_change_author_info_by_email "gbesancon@slb.com" "$EMAIL" "$NAME"
git_change_author_info_by_name "Gilles Besancon" "$EMAIL" "$NAME"