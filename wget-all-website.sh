#!/bin/bash

# Usage: ./wget_all_website.sh [url] [domain]
#  		 ./wget_all_website.sh http://www.url.com/page www.url.com

wget -e robots=off \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=windows \
     --domains $2 \
     --no-parent \
         $1
