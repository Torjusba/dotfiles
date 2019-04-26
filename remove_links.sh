#! /bin/bash

TARGET=$HOME

IGNORE_LIST=".linkignore"


function echo_red {
	echo -e "\033[0;31m"$1"\033[0;m"
}
function echo_green {
	echo -e "\033[0;32m"$1"\033[0;m"
}

echo "Removing all matches in .links"
echo "Proceed? (y/n)"
read resp


if [ $resp != "y" ]; then
	exit
fi

  
for i in $(cat .links); do
	if $(unlink $i); then
		echo_green "Removed link to $i"
	else
		echo_red "Could not remove link to $i"
	fi
done

# Clear links list
rm .links
touch .links
