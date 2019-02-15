FROM eclipse-mosquitto:1.4.12

COPY docker-entrypoint.sh /

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
