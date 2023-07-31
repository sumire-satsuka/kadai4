#!/bin/bash


EROOR_EXIT (){
  echo "$1" >&2
  rm -f /tmp/$$-*
  exit 1
}

./hello.sh > /tmp/$$-result
echo "hello" > /tmp/$$-ans
echo "worlds" >> /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result || EROOR_EXIT "result err"

rm -f /tmp/$$-*
