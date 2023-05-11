#!/bin/bash

sudo transactional-update up
sudo transactional-update pkg install \
	neovim \
	gnome-shell-extension-pop-shell \
	paprius-icon-theme \
	xprop
