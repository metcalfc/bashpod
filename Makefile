UID := $(shell id -u)
GID := $(shell id -g)

build:
	docker build -t bashpod .

# I'm using fixuid magic to handle gitpod's random user number
run: build
	docker run --rm -i -t -u $(UID):$(GID) -v ${PWD}:/home/ubuntu/.dotfiles bashpod bash
