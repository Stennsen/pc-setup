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

# install codium, extensions and settings
distrobox enter code -- distrobox-export -a code

for extension in $(cat extensions)
do
	echo 'installing VS-Codium extension $extension...'
	distrobox enter code -- code --install-extension $extension
done

distrobox enter code -- cd && git clone git@github.com:wroyca/libadwaita-vscode-theme.git libadwaita-vscode

distrobox enter code -- envsubst settings.json > $HOME/.config/Code/User/settings.json

# install rust
distrobox enter code -- curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh

ditrobox enter code -- sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/xdg-open # links xdg-open to the host

echo "dev container setup finished"