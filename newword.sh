#!/bin/sh

WORD_DIR=~/.word
dict $@ -d wn;

if [ ! -f "$WORD_DIR" ]
then 
    touch $WORD_DIR
    echo "new file .word created!"
fi

if egrep -q -i "\<$@\>" $WORD_DIR 
then
    echo "Word exists!"
else
    read -p "Do you want to save the word? Y/n:" choice
    if [ "$choice" = "n" -o "$choice" = "N" ]; then
        echo "No word saved!"
    else
        echo $@ >> "$WORD_DIR" ||echo "Fail to save word!"
        echo "Word successfully saved!"
    fi
fi
