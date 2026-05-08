# Single Node ETCD Cluster

This repository provides a simple local setup for running a **single-node etcd cluster secured with TLS**.

It includes:
- OpenSSL config for localhost certificates
- A script to generate CA, server, and client certificates
- A sample etcd startup command for TLS-enabled client access

## Repository layout

```text
.
├── Scripts/
│   ├── generate-certs.sh
│   └── single-etcd.sh
└── config/
    └── etcd.cnf
```

## Prerequisites

- `etcd` installed and available in PATH
- `openssl` installed

## Quick start

1. Generate certificates:

   ```bash
   chmod +x ./Scripts/generate-certs.sh
   ./Scripts/generate-certs.sh
   ```

2. Start etcd with TLS (example):

   ```bash
   chmod +x ./Scripts/single-etcd.sh
   ./Scripts/single-etcd.sh
   ```

3. Generated certs are stored in:

   ```text
   ./certs
   ```

## What this is for

Use this project as a minimal lab for:
- Learning etcd TLS basics
- Local experiments with secure etcd client connections
- Testing integrations that require a TLS-enabled etcd endpoint
