#!/bin/bash
# A version of ls (list directory contents) that hides files of a directory listed in a .hidden file
# Set -sh or --show-hidden to show hidden files

show_hidden=0

# Test if --show-hidden option is set and store other ls options 
for i; do
	if [ $i == "-sh" ] || [ $i == "--show-hidden" ]; then
		show_hidden=1
	else 
		options+="$i "
	fi
done

# If .hidden file does not exist or --show-hidden option is set exectute ls with given options
if ! [ -f ".hidden" ] || [ "$show_hidden" -eq "1" ]; then
	ls $options
	exit 0
else 
	for line in $(cat .hidden); do
		ignores+="--ignore=$line "
	done

	ls $options $ignores
	exit 0
fi

