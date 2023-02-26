#!/bin/bash

echo "What is your favorite number?"
read num

cat << "EOF" > ./files/money.txt
	  __-----__
     ..;;;--'~~~`--;;;..
   /;-~IN GOD WE TRUST~-.\
  //      ,;;;;;;;;      \\
.//      ;;;;;    \       \\
||       ;;;;(   /.|       ||
||       ;;;;;;;   _\      ||
||       ';;  ;;;;=        ||
||LIBERTY | ''\;;;;;;      ||
 \\     ,| '\  '|><| 2023  //
  \\   |     |      \  A //
   `;.,|.    |      '\.-'/
     ~~;;;,._|___.,-;;;~'
         ''=--'
EOF

for ((i=1 ; i <= ${num} ; i++)); do
	cat ./files/money.txt
	sleep 2
done
