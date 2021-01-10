# Running Mosquitto using username and password authentication

Configure Mosquitto MQTT broker to require client authentication using a valid username and password. Build on top of [official Eclipse Mosquitto MQTT Broker Docker image](https://hub.docker.com/_/eclipse-mosquitto/).

## Usage

Place the Mosquitto credentials to the `.env` file that will be used by the [docker-compose](https://docs.docker.com/compose/).

```
MOSQUITTO_USERNAME=mosquitto
MOSQUITTO_PASSWORD=mosquitto
```

To run a specific version of Mosquitto, check [available tags](https://hub.docker.com/_/eclipse-mosquitto?tab=tags) and add `MOSQUITTO_VERSION=1.5.6` line to `.env` file.

### Build and run

```
docker-compose build
docker-compose up -d
```

### Testing

Try the [MQTT client](http://mqttfx.org/) to connect to the Mosquitto MQTT Broker. Use `127.0.0.1:1883` for a local environment.

Or use official `mosquitto_pub` and `mosquitto_sub` utilities for publishing and subscribing.

```
# Subscribe to topic.
mosquitto_sub -h localhost -t test -u "mosquitto" -P "mosquitto"

# Publish a message.
mosquitto_pub -h localhost -t test -m "hello." -u "mosquitto" -P "mosquitto"
```

## Changelog

**Jan 10, 2021**
* Fix write permissions for mosquitto directories. Check [this thread](https://github.com/eclipse/mosquitto/issues/1078) for details.
* Allow to run a specific version of Mosquitto docker image.
* Add support for Mosquitto 2.x. Check [Migrating from 1.x to 2.0](https://mosquitto.org/documentation/migrating-to-2-0/) for details.
