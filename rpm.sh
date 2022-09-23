#!/bin/bash

rpm-ostree upgrade
rpm-ostree override remove firefox
rpm-ostree install distrobox \
	gnome-shell-extension-dash-to-dock \
	gnome-shell-extension-pop-shell \
	gnome-tweaks \
	neovim \
	papirus-icon-theme \
	sassc \
	xprop
