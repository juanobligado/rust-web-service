## Compose  application

### Rust backend and a Postgresql database

Project structure:
```
.
├── backend
│   ├── Dockerfile
│   ...
├── compose.yaml
└── README.md
```

[_compose.yaml_](compose.yaml)
```
services:
  backend:
    build: backend
    ...
  db:
    image: postgres:12-alpine
    ...
```
The compose file defines an application with two services `backend` and `db`.

## Deploy with docker compose

```
$ docker compose up -d
Creating network "rust-postgres_default" with the default driver
Building backend
...
Successfully tagged react-rust-postgres_frontend:latest
WARNING: Image for service frontend was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Creating react-rust-postgres_frontend_1 ... done
Creating react-rust-postgres_db_1       ... done
Creating react-rust-postgres_backend_1  ... done
```

## Expected result

Listing containers must show two containers running and the port mapping as below:
```
$ docker ps
CONTAINER ID        IMAGE                          COMMAND                  CREATED             STATUS              PORTS                    NAMES
30b7d9dc4898        react-rust-postgres_backend    "cargo run --offline"    37 seconds ago      Up 35 seconds       8000/tcp                 react-rust-postgres_backend_1
0bca0cb682b8        react-rust-postgres_frontend   "docker-entrypoint.s…"   42 seconds ago      Up 41 seconds       0.0.0.0:3000->3000/tcp   react-rust-postgres_frontend_1
1611961bf3d1        postgres:12-alpine             "docker-entrypoint.s…"   42 seconds ago      Up 36 seconds       0.0.0.0:5432->5432/tcp   react-rust-postgres_db_1
```


Stop and remove the containers
```
$ docker compose down
Stopping react-rust-postgres_backend_1  ... done
Stopping react-rust-postgres_frontend_1 ... done
Stopping react-rust-postgres_db_1       ... done
Removing react-rust-postgres_backend_1  ... done
Removing react-rust-postgres_frontend_1 ... done
Removing react-rust-postgres_db_1       ... done
Removing network react-rust-postgres_default
```
