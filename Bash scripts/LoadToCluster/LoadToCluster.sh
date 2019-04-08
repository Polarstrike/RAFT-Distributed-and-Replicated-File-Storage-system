#!/bin/bash
if (( $# != 3 )); then
    echo "Illegal number of parameters: file, addresses, SSH_key";
fi

echo
echo "File to be sent is " $1;
echo "Addresses file is " $2;
echo "Security key is " $3;
echo 
echo

count=0
filename="$2"
path=":/home/ubuntu/proj"
while read -r line; do
    name="$line";
	echo -e "Node $count\t\tSending the file to $line$path";
	let "count++"
	scp -i $3 $1 "ubuntu@$line$path"; 
	echo
	
done < "$filename"