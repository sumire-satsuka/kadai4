#!/bin/bash

result=$(./hello.sh)
if [ $result = "hello" ] ; then
  echo "OK"
  echo 0
else
  echo "NG"
  echo 1
fi
