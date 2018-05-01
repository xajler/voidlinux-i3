#!/bin/bash

function update
{
		#command to update de system
		sudo xbps-install -Suv
}

function install 
{
	#declaration of local variables 
	local pkg
	local argument_input	
	
	#selecting of packages to install
	#flags multi to be able to pick multiple packages
	#exact to match exact match
	#no sort self explanatory
	#cycle to enable cycle scroll
	#reverse to set orientation to reverse
	#margin for margins
	#inline info to display info inline
	#preview to show the package description 
	#header and prompt to give info for people to know how to do stuff
	pkg="$( xbps-query -Rs "" | sort -u | grep -v "*" | fzf -i \
                    --multi --exact --no-sort --select-1 --query="$argument_input" \
                    --cycle --reverse --margin="4%,1%,1%,2%" \
                    --inline-info \
                    --preview 'xbps-query -R {2} '\
                    --preview-window=right:55%:wrap \
                    --header="TAB key to (un)select. ENTER to install. ESC to quit." \
                    --prompt="filter> " | awk '{print $2}'                                                  
            )"
            pkg="$( echo "$pkg" | paste -sd " " )"
            if [[ -n "$pkg" ]]
            then 
            clear
            sudo xbps-install -S $pkg
            fi
}

function purge
{
	local pkg
	local argument_input	
	pkg="$( xbps-query -l | sort -u | 
		fzf -i \
                    --multi \
                    --exact \
                    --no-sort \
                    --select-1 \
                    --query="$argument_input" \
                    --cycle \
                    --reverse \
                    --margin="4%,1%,1%,2%" \
                    --inline-info \
                    --preview 'xbps-query -S {2} '\
                    --preview-window=right:55%:wrap \
                    --header="TAB key to (un)select. ENTER to purge. ESC to quit." \
                    --prompt="filter> " |
                awk '{print $2}'                                                  
            )"
            
            pkg="$( echo "$pkg" | paste -sd " " )"
            if [[ -n "$pkg" ]]
            then 
            clear
            sudo xbps-remove -R $pkg
            fi
}

function unhold
{
	local pkg
	local argument_input	
	pkg="$( xbps-query -p hold -s "" | sort -u | 
		fzf -i \
                    --multi \
                    --exact \
                    --no-sort \
                    --select-1 \
                    --query="$argument_input" \
                    --cycle \
                    --reverse \
                    --margin="4%,1%,1%,2%" \
                    --inline-info \
                    --header="TAB key to (un)select. ENTER to unhold. ESC to quit." \
                    --prompt="filter> " |
                awk '{print $1}'                                                  
            )"
            
            pkg="$( echo "$pkg" | paste -sd " "| tr -d ":" )"
            if [[ -n "$pkg" ]]
            then 
            clear
            sudo xbps-pkgdb -m unhold $pkg
            fi
}

function hold
{
	local pkg
	local argument_input	
	pkg="$( xbps-query -l | sort -u | 
		fzf -i \
                    --multi \
                    --exact \
                    --no-sort \
                    --select-1 \
                    --query="$argument_input" \
                    --cycle \
                    --reverse \
                    --margin="4%,1%,1%,2%" \
                    --inline-info \
                    --preview 'xbps-query -S {2} '\
                    --preview-window=right:55%:wrap \
                    --header="TAB key to (un)select. ENTER to place on hold. ESC to quit." \
                    --prompt="filter> " |
                awk '{print $2}'                                                  
            )"
            
            pkg="$( echo "$pkg" | paste -sd " " )"
            if [[ -n "$pkg" ]]
            then 
            clear
            sudo xbps-pkgdb -m hold $pkg
            fi
}

function maintain
{
	sudo xbps-remove -Oo
	}

function ui
{
while true
do
clear
echo
    echo -e "                     \e[7m XbpsUI - Package manager \e[0m                     "
    echo -e " ┌───────────────────────────────────────────────────────────────┐"
    echo -e " │    1   \e[1mU\e[0mpdate System           2   \e[1mM\e[0maintain System            │"
    echo -e " │    3   \e[1mI\e[0mnstall Packages        4   \e[1mP\e[0murge packages             │"
    echo -e " │    5   \e[1mH\e[0mold Packages           6   \e[1mU\e[0mnhold packages            │"  
    echo -e " └───────────────────────────────────────────────────────────────┘"
    
    echo -e "  Enter number or marked letter(s)   -   0   \e[1mQ\e[0muit "
    read -r choice
    choice="$(echo "$choice" | tr '[:upper:]' '[:lower:]' )"
    echo
    
    case "$choice" in
        1|u|update|update-system )
            update                                                                 
            echo
            echo -e " \e[41m System updated. To return to xbpsUI press ENTER \e[0m"
            # wait for input, e.g. by pressing ENTER:
            read
            ;;
        2|m|maintain|maintain-system )
            maintain
            echo
            echo -e " \e[41m System maintenance finished. To return to xbpsUI press ENTER \e[0m"
            read
            ;;
        3|i|install|install-packages )
            install
            echo
            echo -e " \e[41m Package installation finished. To return to xbpsUI press ENTER \e[0m"
            read
            ;;
        4|p|purge|purge-packages )
            purge
            echo
            echo -e " \e[41m Package(s) purged. To return to xbpsUI press ENTER \e[0m"
            read
            ;;
        5|h|hold|hold-packages )
            hold
            echo
            echo -e " \e[41m Package(s) held. To return to xbpsUI press ENTER \e[0m"
            read
            ;;
         6|u|unhold|unhold-packages )
            unhold
            echo
            echo -e " \e[41m Package(s) unheld. To return to xbpsUI press ENTER \e[0m"
            read
            ;;
        0|q|quit|$'\e'|$'\e'$'\e' )
        clear && exit
            ;;
            
            * )                                                                         
            echo -e " \e[41m Wrong option \e[0m"
            echo -e "  Please try again...  "
            sleep 2
            ;;
            
      esac   
      done
	}
	
ui
