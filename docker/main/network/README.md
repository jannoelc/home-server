# Docker: Main.Network Stack

## Prerequisite

- [Tailscale](https://tailscale.com) account (optional)

## Setup

- \* Generate auth key for [Tailscale](https://login.tailscale.com/admin/settings/keys) on `Settings > Personal Settings > Keys`
- Fill in the required environment variables on `.env`
- Run `bash init.sh`
- (Ignore this on initial install) Copy the certificates and keys to `./caddy/pki_local`
- \*\* Run `docker compose up --profile tailscale -d`

### On Initial Setup

- Download `root.crt` from `./caddy/pki_local` and install the root certificate on your devices
- \* Select your machine on [Tailscale dashboard](https://login.tailscale.com/admin/machines), edit route settings, and allow **Subnet routes**
- \* On [Tailscale DNS settings > Nameservers](https://login.tailscale.com/admin/dns), add custom nameserver based on your environment variable.

```
Nameserver = 69.69.69.4 # Change this based on your IPV4_PREFIX
Restrict to domain = true
Domain = localhost # Change this based on your DOMAIN
```

- \* On [Tailscale DNS settings > Search Domains](https://login.tailscale.com/admin/dns) add your DOMAIN (from environment variables)

### Notes

- \* Skip these steps if `tailscale` profile will not be used
- \*\* Run `docker compose up -d` instead if `tailscale` profile will not be used
