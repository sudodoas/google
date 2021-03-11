#!/bin/sh

#query=$(cat $HOME/.scripts/googlesearch/dictionary.txt | fzf)

echo "type in your search query:"
read query 
choice=$(echo $query | sed 's/ /+/g')

url=$(curl "https://www.google.com/search?sxsrf=ALeKk01YewRFAxy_HI-_kfFyQQ0n6JqHvw%3A1614095039095&source=hp&ei=vyI1YMOUA_Lagwfzl4X4BA&iflsig=AINFCbYAAAAAYDUwz0nHNoDogwqTdZgW6Xmc49mU4wp6&q=$choice&btnK=Google+Search&oq=$choice&gs_lcp=Cgdnd3Mtd2l6EAMyCAguELEDEJMCMggIABCxAxCDATICCAAyAgguMgUIABCxAzICCC4yCwguELEDEMcBEKMCMgIIADILCC4QsQMQxwEQowIyCwguELEDEMcBEK8BOgQIIxAnOgQIABADOgUILhCxA1CjOlj0PWD9PmgAcAB4AYAB8QOIAcEIkgEHMi0yLjAuMZgBAKABAaoBB2d3cy13aXo&sclient=gws-wiz&ved=0ahUKEwiD8L7LrIDvAhVy7eAKHfNLAU8Q4dUDCAc&uact=5" -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36" |
    pup -c |
    grep --color -E -o 'href=".*ping' |
#    sed  's/ping//g' |
    cut -d ' ' -f 1 |
    sed  's/href="//g' |
    sed  's/"//g' |
    sed 's/\/search?*//g' |
    sed 's/.*google.*//g' |
    fzf) 

brave $url
