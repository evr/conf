#!/bin/sh

WORD_DIR=~/.word

if [ ! -f "$WORD_DIR" ]
then 
    touch "$WORD_DIR"
    echo "new file .word created!"
fi

read -p "Do you want to save the word? Y/n:" choice

if [ "$choice" = "y" -o "$choice" = "Y" ]; then
    echo $@ >> "$WORD_DIR";
    echo "Word successfully saved!"
else
    echo "No word saved!"
fi
