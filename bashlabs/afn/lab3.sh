#!/bin/bash

echo "What is your favorite number?"
read num

cat << "EOF" > ./ascii/money.txt
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
	cat ./ascii/money.txt
done
