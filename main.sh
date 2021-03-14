#!/bin/sh

#query=$(cat $HOME/.scripts/googlesearch/dictionary.txt | fzf)

youtubepattern='*youtube*'

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



if [ $1 != "" ]
then
    cd ~/.local/tmp/google/site_downloads/
    
    if [[ "$url" == *youtube* ]]
    then
        echo "youtube video"
        mpv $url
    else
    #    echo "not a youtube video"
    #    cd $HOME/.local/tmp/google
    #    curl $url -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36" | pup -c "h1,h2,p,li,ol,ul,pre" > site.html
    #    pandoc -f html -t markdown site.html > site.md
    #    mdcat site.md -p
    
        echo "not a youtube video"
        #cd $HOME/.local/tmp/google
    #    curl $url -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36" | pup -c "h1,h2,p,li,ol,ul,pre" > site.html
         curl $url -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36" | pup -c "body"  > site.html
        pandoc -f html -t epub  site.html -o $1.epub --metadata title="Website"
        zathura $1.epub
    fi

else

    
    if [[ "$url" == *youtube* ]]
    then
        echo "youtube video"
        mpv $url
    else
    #    echo "not a youtube video"
    #    cd $HOME/.local/tmp/google
    #    curl $url -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36" | pup -c "h1,h2,p,li,ol,ul,pre" > site.html
    #    pandoc -f html -t markdown site.html > site.md
    #    mdcat site.md -p
    
        echo "not a youtube video"
        cd $HOME/.local/tmp/google
    #    curl $url -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36" | pup -c "h1,h2,p,li,ol,ul,pre" > site.html
         curl $url -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36" | pup -c "body"  > site.html
        pandoc -f html -t epub  site.html -o site.epub --metadata title="Website"
        zathura site.epub
    fi
fi

#brave $url
