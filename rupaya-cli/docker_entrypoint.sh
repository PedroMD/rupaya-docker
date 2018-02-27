#!/bin/bash

set -euo pipefail
exec rupaya-cli -rpcconnect=${RPCCONNECT:-rupayad} -rpcuser=${RPCUSER:-rupayarpc} -rpcpassword=${RPCPASSWORD:-ChangeTHISrupayaPASSWORD} "$@"