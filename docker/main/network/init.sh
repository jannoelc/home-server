#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

GENERATED_DIR="$SCRIPT_DIR/tailscale_dns/__generated__"

rm -rf $GENERATED_DIR

mkdir -p $GENERATED_DIR
mkdir -p $GENERATED_DIR/zones

source $SCRIPT_DIR/.env

sed -e "s/VAR_DOMAIN/$DOMAIN/g" \
    $SCRIPT_DIR/tailscale_dns/named.conf.local > $SCRIPT_DIR/tailscale_dns/__generated__/named.conf.local
sed -e "s/VAR_DOMAIN/$DOMAIN/g" \
    -e "s/VAR_IPV4_PREFIX/$IPV4_PREFIX/g" \
    $SCRIPT_DIR/tailscale_dns/zones/domain.zone > $SCRIPT_DIR/tailscale_dns/__generated__/zones/$DOMAIN.zone
