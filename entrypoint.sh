#!/bin/sh

set -e


if [ $# -gt 0 ]; then
	exec "$@"
elif [ -f /webapps/boot.jar ]; then
	java -jar /webapps/boot.jar
else
	bash
fi