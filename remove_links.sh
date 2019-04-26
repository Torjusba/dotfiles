#! /bin/bash

TARGET=$HOME

IGNORE_LIST=".linkignore"

echo "Removing all matches in .links"
echo "Proceed? (y/n)"
read resp


if [ $resp != "y" ]; then
	exit
fi

  
for i in $(cat .links); do
		unlink $i
done
