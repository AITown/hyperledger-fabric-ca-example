#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0

set -e

function networkUp() {
	echo "start docker-compose  up=================="
	docker-compose -f docker-compose-cli.yaml up -d

	# sleep 5
	# docker exec cli scripts/poor.sh
}

function networkDown() {
	echo "start docker-compose  down=================="
	docker-compose -f docker-compose-cli.yaml down --volumes --remove-orphan

}

function printHelp() {
	echo "./start.sh  [command]"
	echo "[command]"
	echo "up      ---启动网络"
	echo "down    ---关闭网络"
	echo "restart ---重启网络"
	echo "-----------------------"
}

MODE=$1

if [ "${MODE}" == "up" ]; then
	networkUp
elif [ "${MODE}" == "down" ]; then ## Clear the network
	networkDown
elif [ "${MODE}" == "restart" ]; then ## Restart the network
	networkDown
	networkUp
else
	printHelp
	exit 1
fi
