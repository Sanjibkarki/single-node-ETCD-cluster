#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

mkdir -p "${REPO_ROOT}/certs"
cd "${REPO_ROOT}/certs"

# 1. CA
openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -subj "/CN=etcd-ca" -days 3650 -out ca.crt

# 2. Server cert
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -config "${REPO_ROOT}/config/etcd.cnf"
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key \
  -CAcreateserial -out server.crt -days 10000 -sha256

# 3. Client cert
openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr -subj "/CN=client"
openssl x509 -req -in client.csr \
  -CA ca.crt -CAkey ca.key \
  -CAcreateserial \
  -out client.crt -days 365 -sha256

echo "Done — certs generated in ${REPO_ROOT}/certs"
