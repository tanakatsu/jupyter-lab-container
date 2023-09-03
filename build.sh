#!/bin/bash

set -eu

if [ ! -d notebooks ]; then
  mkdir -p notebooks
fi

echo !! Please input your password of jupyter lab. If empty is given, password will be \"password\".
read line
# echo $line

if [ -z "$line" ]; then
  password="password"
else
  password=$line
fi

echo Your password is set to \"${password}\".

docker build --build-arg password=${password} -t jupyter_lab_container .
