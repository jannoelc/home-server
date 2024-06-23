# Main stack

## Setup

To install or update, run:

```bash
bash -c "$(wget -qO - https://raw.githubusercontent.com/jannoelc/home-server/develop/lxc/main/install.sh)"
```

To start the docker compose stack with tailscale feature, run:

```typescript
docker compose --profile tailscale up -d
```

Else, start using the command below:

```typescript
docker compose up -d
```
