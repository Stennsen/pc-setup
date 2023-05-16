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

echo 'getting gnome vscode flavour'
distrobox enter code -- rm -rf $HOME/libadwaita-vscode && git clone git@github.com:wroyca/libadwaita-vscode-theme.git $HOME/vscode-libadwaita

echo 'applying settings to VS-Code'
distrobox enter code -- rm $HOME/.config/Code/User/settings.json && mkdir -p $HOME/.config/Code/User/ && envsubst settings.json > $HOME/.config/Code/User/settings.json

echo 'preparing ownership for Custom CSS extension'
distrobox enter code -- sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/xdg-open # links xdg-open to the host

distrobox enter code -- sudo chown -R $(whoami) $(which code) && sudo chown -R $(whoami) /usr/share/code

echo "dev container setup finished"
