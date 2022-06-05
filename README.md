# Running Mosquitto using username and password authentication

Configure Mosquitto MQTT broker to require client authentication using a valid username and password. Built on top of [official Eclipse Mosquitto MQTT Broker Docker image](https://hub.docker.com/_/eclipse-mosquitto/).

## Usage

Place the Mosquitto credentials to the `.env` file that will be used by the [docker-compose](https://docs.docker.com/compose/).

```
MOSQUITTO_USERNAME=mosquitto
MOSQUITTO_PASSWORD=mosquitto
```

To run a specific version of Mosquitto, check [available tags](https://hub.docker.com/_/eclipse-mosquitto?tab=tags) and add `MOSQUITTO_VERSION=1.5.6` line to `.env` file.

### Build and run with [docker compose](https://docs.docker.com/compose/)

```shell
docker-compose build
docker-compose up -d
```

### Build and run with docker

Don't use `latest` tag to avoid any compatibility issues.

```shell
# Use eclipse-mosquitto:latest
docker build --build-arg MOSQUITTO_VERSION=latest -t mosquitto:latest .

# Run as daemon
docker run --name mosquitto -d \
  --restart=always \
  --publish 1883:1883 -p 2222:22 \
  -e MOSQUITTO_USERNAME=mosquitto \
  -e MOSQUITTO_PASSWORD=mosquitto \
  --volume "$(pwd)"/data:/mosquitto/data \
  --volume "$(pwd)"/log:/mosquitto/log \
  mosquitto:latest
```

```shell
# Use eclipse-mosquitto:1.5.6
docker build --build-arg MOSQUITTO_VERSION=1.5.6 -t mosquitto:1.5.6 .

docker run -it --rm --name mosquitto \
  --publish 1883:1883 -p 2222:22 \
  -e MOSQUITTO_USERNAME=mosquitto \
  -e MOSQUITTO_PASSWORD=mosquitto \
  --volume "$(pwd)"/data:/mosquitto/data \
  --volume "$(pwd)"/log:/mosquitto/log \
  mosquitto:1.5.6
```

```shell
# List images
docker image ls
```

### Testing

Try the [MQTT client](http://mqttfx.org/) to connect to the Mosquitto MQTT Broker. Use `127.0.0.1:1883` for a local environment.

Or use official `mosquitto_pub` and `mosquitto_sub` utilities for publishing and subscribing.

```shell
# Subscribe to topic.
mosquitto_sub -h localhost -t test -u "mosquitto" -P "mosquitto"

# Publish a message.
mosquitto_pub -h localhost -t test -m "hello." -u "mosquitto" -P "mosquitto"
```

## Changelog

**June 5, 2022**
* Provide an instructions of how to run service with just a Docker.

**Jan 10, 2021**
* Fix write permissions for mosquitto directories. Check [this thread](https://github.com/eclipse/mosquitto/issues/1078) for details.
* Allow to run a specific version of Mosquitto docker image.
* Add support for Mosquitto 2.x. Check [Migrating from 1.x to 2.0](https://mosquitto.org/documentation/migrating-to-2-0/) for details.
