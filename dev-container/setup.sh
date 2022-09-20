#!/bin/bash

echo "building image"
podman build -f Dockerfile -t code-container:latest
echo "done"

mkdir -p ~/Code
cp ./.bashrc ~/Code

entry=`distrobox-list | grep "code"`
if [ -n "$entry" ]; then
	echo "removing old container"
	podman rm --force code
	echo "done"
fi

echo "creating new container"
distrobox create -n code -H ~/Code -i code-container:latest
echo "done"
systemctl --user enable --now podman.socket
distrobox enter code -- distrobox-export -a codium

echo "dev container setup finished"
