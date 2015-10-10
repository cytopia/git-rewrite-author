#!/bin/sh
#
# @Author:  cytopia <cytopia@everythingcli.org>
# @Version: v0.1
# @Date:    2015-04-27
#

# Ask a yes/no question and read users choise
#
# @param        string  Question to ask
# @param        string  Default 'Y' or 'N'
# @return       int             1: yes | 0:no
ask() {
	question=$1

	while true; do

		if [ "${2:-}" = "Y" ]; then
			prompt="$(tput setaf 3)Y$(tput sgr0)/$(tput setaf 3)n$(tput sgr0)"
			default=Y
		elif [ "${2:-}" = "N" ]; then
			prompt="$(tput setaf 3)y$(tput sgr0)/$(tput setaf 3)N$(tput sgr0)"
			default=N
		else
			prompt="$(tput setaf 3)y$(tput sgr0)/$(tput setaf 3)n$(tput sgr0)"
			default=
		fi


		# /dev/tty for redirection
		read -p "$(tput setaf 2)${question} $(tput sgr0)(${prompt})" yn </dev/tty

		# Default?
		if [ -z "$yn" ]; then
			yn=$default
		fi

		case $yn in
			[Yy]* ) return 0 ;;
			[Nn]* ) return 1 ;;
			* )		echo "Please answer (y)es or (n)o.";;
		esac

	done
}



# Bind a file (Symlink or copy)
#
# @param		string	From file
# @param		string	To file
# @param		string	Type: "ln" or "cp"
# @return		int		0:success | 1:failure
_bind_file() {

	from="${1}"
	to="${2}"
	bind_type="${3}"

	# If the source file does not exist, do nothing!!
	if [ ! -f "${from}" ] && [ ! -d "${from}" ] ; then

		echo "$(tput setaf 1)${from}$(tput sgr0) does not exist."
		return 1

	else

		# 3) Check if parent directory actually exists
		#    and if not create it first prior symlinking
		#    Otherwise symlinking will not work
		parent=$(dirname "${to}")
		if [ ! -d "${parent}" ]; then
			mkdir -p "${parent}"
		fi

		# 4) Symlink/Copy the sucker
		if [ "${bind_type}" = "ln" ]; then
			ln -s "${from}" "${to}"
		elif [ "${bind_type}" = "cp" ]; then
			cp -r "${from}" "${to}"
		fi

		return 0
	fi
}


symlink_file() {
	from="${1}"
	to="${2}"
	_bind_file "${from}" "${to}" "ln"
}
copy_file() {
	from="${1}"
	to="${2}"
	_bind_file "${from}" "${to}" "cp"
}
