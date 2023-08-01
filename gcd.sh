#!/bin/bash

# 引数の数を確認
if [ $# -ne 2 ]
then
  echo "Error: 引数は二つです。"
  exit 1
fi

# 引数が自然数であることを確認
if [[ $1 =~ ^0[0-9]*$ ]] || [[ $2 =~ ^0[0-9]*$ ]]
then
  echo "Error: ごめんなさい。先頭に０を入力するとなんだかうまくいかないんです。"
  exit 1
elif [[ $1 =~ ^- ]] ||  [[ $2 =~ ^- ]]
then
  echo "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
elif  [[ $1 =~ \..* ]] ||  [[ $2 =~ \..* ]]
then
  echo "Error: 小数点とか入力してはダメです。だって自然数だから。"
  exit 1
elif ! [[ $1 =~ ^[1-9][0-9]*$ ]] || ! [[ $2 =~ ^[1-9][0-9]*$ ]]
then
  echo "Error: 10進数の自然数を入れてね！"
  exit 1
fi

# 最大公約数を求める関数
gcd() {
  local first=$1
  local second=$2
  if [ $second -eq 0 ]
  then
    echo $first
  else
    gcd $second $(($first % $second))
  fi
}

# 最大公約数を計算して出力
gcd $1 $2
exit 0

