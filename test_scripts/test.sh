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


# 2と4を入力する && 2を出力したら成功 || 出力しなかったらエラー
result=$(./gcd.sh 2 4)
if [ $result = 2 ] ; then
  echo "OK"
else
  echo "NG"
  exit 1
fi

# 3を入力する || エラーメッセージが出なかったらエラー
result=$(./gcd.sh 3)
if [ $result = "Error: 引数は二つです。" ] ; then
  echo "OK"
else
  echo "NG"
  exit 1
fi

# 文字を入力する || エラーメッセージが出なかったらエラー
result=$(./gcd.sh aaa bbb)
if [ $result = "Error: 10進数の自然数を入れてね！" ] ; then
  echo "OK"
else
  echo "NG"
  exit 1
fi

# 引数の数が多い
result=$(./gcd.sh 3 4 5 5)
if [ $result = "Error: 引数は二つです。" ] ; then
  echo "OK"
else
  echo "引数多すぎ"
  exit 1
fi

# 数値が自然数
result=$(./gcd.sh 3.4 4)
if [ $result = "Error: 引数は二つです。" ] ; then
  echo "OK"
else
  echo "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
result=$(./gcd.sh 3.4 4.2)
if [ $result = "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" ] ; then
  echo "OK"
else
  echo "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
result=$(./gcd.sh 3 4.2)
if [ $result = "Error: 引数は二つです。" ] ; then
  echo "OK"
else
  echo  "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi

# 負の数
result=$(./gcd.sh 3.4 4)
if [ $result = "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" ] ; then
  echo "OK"
else
  echo "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
result=$(./gcd.sh 3.4 4.2)
if [ $result = "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" ] ; then
  echo "OK"
else
  echo  "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
result=$(./gcd.sh 3 4.2)
if [ $result = "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" ] ; then
  echo "OK"
else
  echo  "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。"
  exit 1
fi
# 小数
# 先頭に0
# 大きいなど

exit 0
