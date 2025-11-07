# Relational DB Playground

A small Postgres + SQL practice project. Contains:

- `docker-compose.yaml` to spin up a local PostgreSQL instance.
- Local persisted cluster data ignored from git (`data/`).

## Run Postgres locally

```bash
# Start container (detached)
docker compose up -d

# View logs
docker compose logs -f

# Stop
docker compose down
```

If the compose file defines a volume mapping to `./data`, the cluster state will persist across restarts.
