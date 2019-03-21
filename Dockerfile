FROM eclipse-mosquitto:1.5.8

COPY docker-entrypoint.sh /
COPY ./config/mosquitto.conf /etc/mosquitto.conf

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/etc/mosquitto.conf"]
