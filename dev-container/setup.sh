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
distrobox enter code -- codium --install-extension piousdeer.adwaita-theme
distrobox enter code -- codium --install-extension svelte.svelte-vscode
distrobox enter code -- codium --install-extension vscodevim.vim
distrobox enter code -- codium --install-extension ms-python.python
distrobox enter code -- codium --install-extension vscode.npm
distrobox enter code -- codium --install-extension redhat.java
distrobox enter code -- codium --install-extension redhat.vscode-xml
distrobox enter code -- codium --install-extension redhat.vscode-yaml
distrobox enter code -- codium --install-extension bradlc.vscode-tailwindcss
distrobox enter code -- codium --install-extension Kelvin.vscode-sshfs
echo "dev container setup finished"
