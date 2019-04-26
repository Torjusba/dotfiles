#! /bin/bash

IGNORE_LIST=".linkignore"

# Default target
TARGET=$HOME

function echo_green {
	echo -e "\033[0;32m"$1"\033[0;m"

}
function echo_yellow {
	echo -e "\033[0;33m"$1"\033[0;m"

}
function echo_red {
	echo -e "\033[0;31m"$1"\033[0;m"

}

if [ "$1" == "" ]; then
	echo "No target specified. Using default"
else
	TARGET=$1
fi

echo "Target is $TARGET"
echo "Proceed? (y/n)"
read resp

if [ $resp != "y" ]; then
	exit
fi

# $1=FROM, $2=DEST
make_link() {
	#echo "make_link called with $1 and $2"
	for i in $(ls -A $1); do
		if  echo $i | grep -E -q -n -f $IGNORE_LIST; then
			echo "Ignoring $i"
		else
			if $(ln -fs $PWD/$1/$i $2 &> /dev/null); then
				echo "$2/$i" >> .links
				echo_green "Linked '$i'"
			else
				# Directory error
				echo_yellow "Directory '$i' already exists. Merging"
				make_link "$1/$i" "$2/$i"
			fi
		fi
	done
}

make_link . $TARGET
