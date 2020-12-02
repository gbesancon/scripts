#!/bin/sh
#set -e
#set -x

source $(dirname $(realpath ${BASH_SOURCE[0]}))/../../../utils/apt.sh

setup()
{
  result=0
  echo Installing pandoc texlive
  install_packages pandoc texlive
  install_package_result=$?
  if [ $install_package_result -eq 0 ]
  then
    result=$install_package_result
  else
    result=$install_package_result
  fi
  return $result
}

setup
exit_on_error $?
