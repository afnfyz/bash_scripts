#!/bin/bash

compress(){
tar -czf "${farg}" $1 $2 $3
}

while getopts "f:" OPTION; do
    case "$OPTION" in
	f)
	  farg="$OPTARG"
	  compress()
	  ;;
	*)
	  echo "Script Requirements: [-f <file name>]" 
    esac
done
