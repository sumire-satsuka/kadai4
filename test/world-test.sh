#!/bin/bash

./hello.sh > /tmp/$$-result
echo "hello" > /tmp/$$-ans
echo "world" >> /tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo "OK"

rm /tmp/$$-ans /tmp/$$-result
