FROM ubuntu:20.04

RUN set -eux; \
	apt-get update; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential procps curl file git vim less \
        apt-transport-https ca-certificates software-properties-common \
	; \
	rm -rf /var/lib/apt/lists/*; \
	apt clean

RUN addgroup --gid 1000 ubuntu && \
    adduser --uid 1000 --ingroup ubuntu --home /home/ubuntu --shell /bin/sh --disabled-password --gecos "" ubuntu

# Gitpod users are almost never 1000 so fix it
RUN USER=ubuntu && \
    GROUP=ubuntu && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5.1/fixuid-0.5.1-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

USER ubuntu:ubuntu

WORKDIR /home/ubuntu/

ENTRYPOINT ["fixuid"]