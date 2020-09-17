#!/bin/bash

set -e

usage() {
	echo "#### Docker Image for Boot JAR directly ###########################################"
	echo "Usage:  "
	echo "        Bind jar file to /webapps/boot.jar"
	echo "        Default expose port is 8080"
	echo "Envronments:"
	echo "        JAVA_OPTS: java options, now is '${JAVA_OPTS}'"
	echo "                   or using continuous variable from 0 as JAVA_OPT_{0...} instead."
	echo "        BOOT_ARGS: application arguments, now is '${BOOT_ARGS}'."
	echo "                   or using continuous variable from 0 as BOOT_ARG_{0...} instead."
	echo "###################################################################################"
	echo ""
}


i=0
while true
do
	ARG=JAVA_OPT_$i
	if [ -z "${!ARG}" ]; then
		break
	fi
	# echo "${!ARG}"
	JAVA_OPTS="$JAVA_OPTS ${!ARG}"
	i=$(($i + 1))
done


i=0
while true
do
	ARG=BOOT_ARG_$i
	if [ -z "${!ARG}" ]; then
		break
	fi
	# echo "${!ARG}"
	BOOT_ARGS="$BOOT_ARGS ${!ARG}"
	i=$(($i + 1))
done

if [ $# -gt 0 ]; then
	exec "$@"
elif [ -f /webapps/boot.jar ]; then
	java ${JAVA_OPTS} -jar /webapps/boot.jar ${BOOT_ARGS}
else
	usage
fi