#!/bin/bash

set -euo pipefail

DATA_DIR=/rupaya
RUPAYA_CONF=${DATA_DIR}/rupaya.conf

# If config doesn't exist or is empty, initialize with sane defaults.
if [ ! -s "${RUPAYA_CONF}" ]; then

  cat >${RUPAYA_CONF} <<EOF
rpcuser=${RPCUSER:-rupayarpc}
rpcpassword=${RPCPASSWORD:-ChangeTHISrupayaPASSWORD}
rpcport=${RPCPORT:-7020}
rpcallowip=${RPCALLOWIP:-::/0}
rpcbind=0.0.0.0
listen=1
daemon=0
printtoconsole=${PRINTTOCONSOLE:-1}
EOF
fi

if [ $# -eq 0 ]; then
	exec rupayad -datadir=${DATA_DIR} -conf=${RUPAYA_CONF}
else
 	exec rupayad -datadir=${DATA_DIR} -conf=${RUPAYA_CONF} "$@"
fi