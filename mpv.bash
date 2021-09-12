#!/bin/bash

curl "https://dic.daum.net/search.do?q=pattern" |\
  sed -En -e '/tit_word"/{s/(<[^>]+>)(.+)(<[^>]+>)/\2/;bX}'\
  -e '/"num_search"/{s/>([^<]+)|(.)/\1/g;bX}'\
          -e 'b'\
          -e ':X p'\
          -e 'e sleep 1'
