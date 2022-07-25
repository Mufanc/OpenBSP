FROM debian:stable

RUN apt-get update; \
    apt-get install -y sdcc python3 python3-pip; \
    pip install stcgal; \
    rm -rf /usr/share/doc/*; \
    rm -rf /usr/share/info/*; \
    rm -rf /tmp/*; \
    rm -rf /var/tmp/*

WORKDIR /host

ENTRYPOINT [ "sh", "build.sh" ]
