#!/bin/bash

	mp3="/home/ming/project/dic/mp3"

	clear
	echo ">> $1"
	[[ $1 ]] && (curl https://dic.daum.net/search.do?q=$1 \
	2> /dev/null \
	| sed -En '/단어장 저장/,/듣기/p' \
	| sed -E 's/(>[^<]+)|(.)/\1/g' \
	| sed -E 's/>//g' \
	| sed -En '/[1-9]/p'
	
curl https://dic.daum.net/search.do?q=$1 \
	2> /dev/null \
	| sed -En '/단어장 저장/,/듣기/p' \
	| sed -E 's/data-audio data-url="/>/g' \
	| sed -E 's/" data-count/</g' \
	| sed -E 's/(>[^<]+)|(.)/\1/g' \
	| sed -E 's/>//g' \
	| sed -En '/[1-9]/p' \
	| sed -E 's/\[[^]]+\]|\s//g' \
	| sed -E '/^[1-9].+/d' \
	| xargs -I{} curl -o $mp3/$1.mp3 {} \
	> /dev/null 2>&1
	mpv /home/ming/project/dic/mp3/$1.mp3 > /dev/null 2>&1
	sleep 1
	mpv /home/ming/project/dic/mp3/$1.mp3 > /dev/null 2>&1
	sleep 1
	mpv /home/ming/project/dic/mp3/$1.mp3 > /dev/null 2>&1
) || (mpv "$mp3" > /dev/null 2>&1)
	

