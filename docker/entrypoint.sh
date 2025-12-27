#!/usr/bin/env sh
set -eu

CONFIG_PATH="${CONFIG_PATH:-/data/config.yaml}"
PORT="${PORT:-8317}"
AUTH_DIR="${AUTH_DIR:-/data/auths}"
WRITABLE_PATH="${WRITABLE_PATH:-/data}"

export WRITABLE_PATH

mkdir -p "$(dirname "$CONFIG_PATH")" "${AUTH_DIR}" "${WRITABLE_PATH}/logs"

if [ ! -s "${CONFIG_PATH}" ]; then
  cat > "${CONFIG_PATH}" <<EOF
host: ""
port: ${PORT}
auth-dir: "${AUTH_DIR}"
logging-to-file: true
usage-statistics-enabled: true
EOF
fi

exec /CLIProxyAPI/CLIProxyAPI -config "${CONFIG_PATH}"
