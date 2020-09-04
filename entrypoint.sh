#!/bin/sh

set -e


if [ $# -gt 0 ]; then
	exec "$@"
elif [ -f /webapps/boot.jar ]; then
	java ${JAVA_OPTS} -jar /webapps/boot.jar ${BOOT_ARGS}
else
	bash
fi