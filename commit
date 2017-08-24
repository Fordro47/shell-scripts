#!/bin/sh
response=$(commit 2>&1)

if [[ "$response" == *"commit: command not found"* ]]
then
	echo "Command: \"commit\" does not exist."
	echo "Adding it..."
	cd /usr/local/bin
	touch commit
	echo "
		read -p \"Enter Contributor(s)::\" committers
		arrIn=(${committers})

		if [ -n \"${arrIn[2]}\" ]
		then
			echo \"Enter 1 or 2 contributors!\"
			commit
		elif [ -n \"${arrIn[1]}\" ]
		then
			echo \"2 contributors!\"
			git duet ${arrIn[0]} ${arrIn[1]}
			read -p \"Commit Message : \" commitMessage
			git duet-commit -m \"$commitMessage\"
		else
			echo \"1 contributor!\"
			read -p \"Commit Message : \" commitMessage
			git commit -m \"$commitMessage\"
		fi

		echo \"You have committed!\"
		echo \"DONT FORGET TO PUSH!\"
	" > commit
	chmod 777 commit
	echo "Comand: \"commit\" ADDED!"
fi

read -p "Enter Contributor(s)::" committers
arrIn=(${committers})

if [ -n "${arrIn[2]}" ]
then
	echo "Enter 1 or 2 contributors!"
	commit
elif [ -n "${arrIn[1]}" ]
then
	echo "2 contributors!"
	git duet ${arrIn[0]} ${arrIn[1]}
	read -p "Commit Message : " commitMessage
	git duet-commit -m "$commitMessage"
else
	echo "1 contributor!"
	read -p "Commit Message : " commitMessage
	git commit -m "$commitMessage"
fi

echo "You have committed!"
echo "DONT FORGET TO PUSH!"