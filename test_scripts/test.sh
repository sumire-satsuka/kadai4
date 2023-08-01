#!/bin/bash

# 各テストを一つ一つスクリプトにする。
# じゃないとexitで終わってしまう。
# あるいはexit0 は最後につける
# 
# 1. テスト内容なより多くのパターンを網羅するように
# 	引数の数が多い・少ない・丁度いい、数値が自然数、負の数、小数、大きいなど、
# 	エラーに繋がりそうなパターンを多く網羅するようテストしましょう
# 2. 正常終了とエラー終了を使い分ける
# 	GitHub actionsではエラー終了をキャッチして通知を行います
# 	exitする際は正常終了、異常終了をしっかり区別しましょう
# 
# echo "hoge"


# 1. 2と4を入力する && 2を出力したら成功 || 出力しなかったらエラー
result=$(./gcd.sh 2 4)
if [[ $result = 2 ]] ; then
  echo "1 OK"
else
  echo "NG"
  exit 1
fi

# 2. 3を入力する || エラーメッセージが出なかったらエラー
result=$(./gcd.sh 3)
if [[ $result = "Error: 引数は二つです。" ]] ; then
  echo "2 OK"
else
  echo "NG"
  exit 1
fi

# 3. 文字を入力する || エラーメッセージが出なかったらエラー
result=$(./gcd.sh aaa bbb)
if [[ $result = "Error: 10進数の自然数を入れてね！" ]] ; then
  echo "3 OK"
else
  echo "NG"
  exit 1
fi

# 4. 引数の数が多い
result=$(./gcd.sh 3 4 5 5)
if [[ $result = "Error: 引数は二つです。" ]] ; then
  echo "4 OK"
else
  echo "引数多すぎ"
  exit 1
fi

# 5. 数値が小数点を含む
result=$(./gcd.sh 3.4 4)
if [[ $result = "Error: 小数点とか入力してはダメです。だって自然数だから。" ]] ; then
  echo "5-1 OK"
else
  echo "5-1 Error: 小数点とか入力してはダメです。だって自然数だから。"
  exit 1
fi
result=$(./gcd.sh 3.4 4.2)
if [[ $result = "Error: 小数点とか入力してはダメです。だって自然数だから。" ]] ; then
  echo "5-2 OK"
else
  echo "5-2 Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
result=$(./gcd.sh 3 4.2)
if [[ $result = "Error: 小数点とか入力してはダメです。だって自然数だから。" ]] ; then
  echo "5-3 OK"
else
  echo  "5-3 Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi

# 6. 負の数
result=$(./gcd.sh -3 4)
if [[ $result = "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" ]] ; then
  echo "6-1 OK"
else
  echo "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
result=$(./gcd.sh 3 -4)
if [[ $result = "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" ]] ; then
  echo "6-2 OK"
else
  echo  "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
result=$(./gcd.sh -3 -4)
if [[ $result = "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" ]] ; then
  echo "6-3 OK"
else
  echo  "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
# 小数
# 先頭に0
# 大きいなど

exit 0
