# PostgreSQL with HLL Extension Docker Images

Builds and pushes multi-architecture Docker images with the [HyperLogLog (HLL)](https://github.com/citusdata/postgresql-hll) extension to the Github Container Registry.

## Usage

The docker image is based on the official PostgreSQL images, so you can use the same syntax to run it: https://hub.docker.com/_/postgres

For example:
```sh
docker run --name postgres -e POSTGRES_PASSWORD=mysecretpassword -d ghcr.io/antoinefink/postgresql-hll:16-alpine
```

## Building and pushing new images

```sh
./build.sh <USERNAME> <POSTGRES_VERSION> <HLL_VERSION>
```

For example:

```sh
./build.sh antoinefink 16 2.18
```

## License

MIT. Forked from https://github.com/hbontempo-br/docker-postgres-hll.
