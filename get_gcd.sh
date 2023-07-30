#!/bin/bash

# 最大公約数を求める関数
gcd() {
  local a=$1
  local b=$2
  if [ $b -eq 0 ]
  then
    echo $a
  else
    gcd $b $(($a % $b))
  fi
}

# 引数が自然数であることを確認する関数
check_number() {
  if ! [[ $1 =~ ^[1-9][0-9]*$ ]]
  then
    return 1
  else
    return 0
  fi
}

# 引数をチェック
while true
do
  read -p "Enter first natural number: " num1
  read -p "Enter second natural number: " num2
  if check_number $num1 && check_number $num2
  then
    break
  else
    echo "Error: Both inputs must be natural numbers. Please try again."
  fi
done

# 最大公約数を計算して出力
gcd $num1 $num2
exit 0

