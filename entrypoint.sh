#!/bin/sh

set -e

usage() {
	echo "#### Docker Image for Boot JAR directly"
	echo "Usage:  "
	echo "        Bind jar file to /webapps/boot.jar"
	echo "        Default expose port is 8080"
	echo "Envronments:"
	echo "        JAVA_OPTS: java options, default is ${JAVA_OPTS}"
	echo "        BOOT_ARGS: application arguments, default is empty."
	echo ""
}

if [ $# -gt 0 ]; then
	exec "$@"
elif [ -f /webapps/boot.jar ]; then
	java ${JAVA_OPTS} -jar /webapps/boot.jar ${BOOT_ARGS}
else
	usage
fi