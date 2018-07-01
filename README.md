### Usage

I have used the [official Eclipse Mosquitto MQTT Broker Docker image](https://hub.docker.com/_/eclipse-mosquitto/).

Place the Mosquitto credentials to the `.env` file that will be used by the [docker-compose](https://docs.docker.com/compose/).

```
MOSQUITTO_USERNAME=mosquitto
MOSQUITTO_PASSWORD=mosquitto
```

Let's build and run:

```
docker-compose build
docker-compose up -d
```

Try the [MQTT client](http://mqttfx.org/) to connect to the Mosquitto MQTT Broker. Use `127.0.0.1:1883` for a local environment.
