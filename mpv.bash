#!/bin/bash

curl "https://dic.daum.net/search.do?q=pattern" 2>/dev/null |\
  sed -En -e '/tit_word"/{s/(.+)(<[^>]+>)(.+)(<[^>]+>)/\3/;bX}'\
  -e '/"num_search"/{s/>([^<]+)|(.)/\1/g;s/^\s*//;bX}'\
  -e '/txt_searchword/{s/<[^>]+>//g;s/^\s*//;bX}'\
  -e '/data-audio data-url=/{s/(.+)url=("[^"]+")(.+)/mpv \2 >\/dev\/null 2>\&1/e;bX}'\
          -e 'b'\
          -e ':X p'\
          
