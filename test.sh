
echo "$(cat vars.txt | grep routes: | awk -F default '{print $2 }' | awk -F , '{print $1 }')" > def;

# echo "$(cat vars.txt | grep routes: )"