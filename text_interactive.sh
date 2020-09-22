#!/bin/bash
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo $'\033[96m     *     INTERACTIVE MENU     *             \e[0m'
echo $'You can:\na - use calculator (command is: \033[31mcalc\e[0m)\nb - use reverse (command is: \033[32mreverse\e[0m)\nc - find the length of a string (command is: \033[33mstrlen\e[0m)\nd - log\ne - exit with a code (command is: \033[35mexit\e[0m)\nf - see manual for everything (command is: \033[36mhelp\e[0m)\ng - use function search (command is: \033[34msearch\e[0m)\nTo use the command you like, you just need to input either the letter of the command or the specific coloured identifier. Try!'
read inp
case "$inp" in
	calc | a)
	echo "Enter sum/sub/mul/div and two ints in one line!"
	read var n1 n2
	var2 = &(./text_calc.sh " " "$var" "$n1" "$n2")
	echo $var2
	. ./text_interactive.sh
	;;

	reverse | b)
	echo "Enter the two name files"
	read var3 var4
	echo "Done! Check out the $var4 file!"
	. ./text_interactive.sh
	;;

	strlen | c)
	echo "Enter a string:"
	read str
	var6 = &(./text_string.sh " " "$str")
	echo "The length of your string is... $var6"
	echo " "
	. ./text_interactive.sh
	;;
	
	log | d)
	echo "We need to do stuff!"
	;;
	
	exit | e)
	echo "Would you like to input exit code? If not, just hit the enter button"
	read varr
	
	if [[ -z $varr ]]; then
		echo "Just exiting..."
		exit 0
	fi

	if [[ ! $varr =~ ^[\+|-]?[0-9]+$ ]]; then
		echo "Exiting..."
		exit 1
	else
		echo "Exiting with a code... $varr"
		exit $varr
	fi
	;;

	help | f)
	echo "This is a manual."
	echo "$(<help.txt)"
	echo " "
	./text_interactive.sh
	;;

	search | g)
	echo "Search"
	;;
	*)
	echo "Invalid option. Try again."
	. ./text_interactive.sh
	;;
esac

