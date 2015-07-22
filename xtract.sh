#!/bin/bash

# TODO
# Bug: ./xtract.sh: строка 7: [: пропущен `]'
# Happens after running the script. Bug is not fatel. 

SLACKBUILD="$1"
SOURCE="$2"
SLACKBUILDNAME="$(basename $SLACKBUILD .tar.gz)"

if [ -z $SOURCE]; then
	echo "$0 Slackbuild Source"
	exit 
fi

if [ ! -f $PWD/$SLACKBUILD ]; then
    echo "Error: $SLACKBUILD not exist"
    exit
fi

if [ ! -f $PWD/$SOURCE ]; then
    echo "Error: $SOURCE not exist"
    exit
fi


gzip -d $SLACKBUILD
tar -xf $SLACKBUILDNAME.tar
rm $SLACKBUILDNAME.tar
mv $SOURCE $SLACKBUILDNAME
