#!/bin/sh
i=0
ebusctl find -c $1 | awk '{print $2}' > output.txt
awk 'NF' output.txt > o.txt
file='o.txt'

while IFS= read -r line
do
((i=i+1))
ebusctl read "$line" < /dev/null
done < "$file"
echo "Values readed from $1."
