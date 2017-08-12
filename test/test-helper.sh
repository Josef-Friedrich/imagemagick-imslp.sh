#! /bin/sh

mock_path() {
	_rm_dash() {
		echo $@ | sed 's#/*$##'
	}
	SAVEIFS=$IFS
	IFS=:
	local TMP_PATH
	TMP_PATH=
	if [ -n "$PARENT_MOCK_PATH" ]; then
		for P in $1 ; do
			TMP_PATH="${TMP_PATH}$(_rm_dash $PARENT_MOCK_PATH)/$(_rm_dash $P):"
		done
		export PATH="${TMP_PATH}${PATH}"
	else
		export PATH="$(_rm_dash $1):${PATH}"
	fi
	IFS=$SAVEIFS
}

source_exec() {
	local TMP_FILE
	TMP_FILE=$(mktemp)
	local SEPARATOR
	SEPARATOR='## This SEPARATOR is required for test purposes. Please don’t remove! ##'
	if [ -n "$SOURCE_EXEC_SEPARATOR" ]; then
		SEPARATOR="$SOURCE_EXEC_SEPARATOR"
	fi
	if [ -f "$1" ]; then
		sed "/$SEPARATOR/Q" "$1" > "$TMP_FILE"
		. "$TMP_FILE"
	else
		echo "The file “$1” doesn’t exist and therefore couldn’t be sourced!"
	fi
}
