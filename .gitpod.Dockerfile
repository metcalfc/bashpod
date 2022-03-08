FROM ubuntu:20.04

RUN set -eux; \
	apt-get update; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential procps curl file git vim \
        apt-transport-https ca-certificates software-properties-common \
	; \
	rm -rf /var/lib/apt/lists/*; \
	apt clean

RUN useradd -m -s /bin/bash -G sudo ubuntu
USER ubuntu
WORKDIR /home/ubuntu

VOLUME /home/ubuntu/.dotfiles

CMD ["/bin/bash"]