FROM envoyproxy/envoy:v1.31-latest

COPY envoy-config-template.yaml /etc/envoy/envoy-config-template.yaml

COPY gen/definitions.pb /etc/envoy/definitions.pb

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && \
    apt-get install -y gettext && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh && \
    mkdir /configs && \
    chown -R envoy:envoy /configs

CMD ["/entrypoint.sh"]