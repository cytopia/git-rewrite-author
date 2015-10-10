#!/bin/sh
#
# @Author:  cytopia <cytopia@everythingcli.org>
# @GPG Key: 
# @Date:    2015-10-10
#
# installer
#



#######################################################################################
#
# VARIABLES
#
#######################################################################################


# MY DIR
SELF=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)


# CONFIG FILE
#CONF="install.config"
LIB="${SELF}/.lib"

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:$PATH"


. ${LIB}/functions.sh



if ask "Symlink git-rewrite-author to ~/bin?" Y; then

	BIN_DIR="${HOME}/bin/"

	if [ ! -d "${BIN_DIR}" ]; then
		mkdir -p "${BIN_DIR}"
	fi

	# Symlink core and modules
	symlink_file "${SELF}/bin/git-rewrite-author" "${BIN_DIR}/git-rewrite-author"
fi

exit 0
