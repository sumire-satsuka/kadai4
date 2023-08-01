#!/bin/bash

# 1. 2と4を入力する && 2を出力したら成功 || 出力しなかったらエラー
echo "2" > /tmp/$$-ans
./gcd.sh 2 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー 1" > /tmp/$$-error.log

# 2. 3を入力する || エラーメッセージが出なかったらエラー
echo "Error: 引数は二つです。" > /tmp/$$-ans
./gcd.sh 3 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー 2" > /tmp/$$-error.log

# 3. 文字を入力する || エラーメッセージが出なかったらエラー
echo "Error: 10進数の自然数を入れてね！" > /tmp/$$-ans
./gcd.sh aaa bbb > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー 3" > /tmp/$$-error.log

# 4. 引数の数が多い
echo "Error: 引数は二つです。" > /tmp/$$-ans
./gcd.sh 3 4 5 6 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー 4" > /tmp/$$-error.log

# 5. 数値が小数点を含む
## 5-1 $1 が小数点を含む
echo "Error: 小数点とか入力してはダメです。だって自然数だから。" > /tmp/$$-ans
./gcd.sh 3.4 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー 5-1" > /tmp/$$-error.log


## 5-2 $1 $2 が小数点を含む
echo "Error: 小数点とか入力してはダメです。だって自然数だから。" > /tmp/$$-ans
./gcd.sh 3.4 4.2 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー5-2" > /tmp/$$-error.log

## 5-3 $2 が小数点を含む
echo "Error: 小数点とか入力してはダメです。だって自然数だから。" > /tmp/$$-ans
./gcd.sh 3 4.2 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー5-2" > /tmp/$$-error.log


# 6. 負の数
## 6-1 $1が負の数
echo "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" > /tmp/$$-ans
./gcd.sh -3 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー6-1" > /tmp/$$-error.log

## 6-2 $2が負の数
echo "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" > /tmp/$$-ans
./gcd.sh 3 -4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー6-2" > /tmp/$$-error.log

## 6-3 $1 $2が負の数
echo "Error: 最大公約数を求めるのに、なんで負の数入れたの？あなたが入れるべきは正の整数です。" > /tmp/$$-ans
./gcd.sh -3 -4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー6-2" > /tmp/$$-error.log

# 7 先頭に0
echo "Error: ごめんなさい。先頭に０を入力するとなんだかうまくいかないんです。" > /tmp/$$-ans
./gcd.sh -3 -4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー7" > /tmp/$$-error.log

# 8 大きい数
echo "20000" > /tmp/$$-ans
./gcd.sh 20000  40000 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー 8" > /tmp/$$-error.log

if [ -f /tmp/$$-error.log ] ; then
  cat /tmp/$$-error.log 1>&2
  rm -f /tmp/$$-*
  exit 1
fi

exit 0
