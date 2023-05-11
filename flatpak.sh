#!/usr/bash

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-delete fedora
flatpak update -y
flatpak install -y --user flathub com.brave.Browser \
	com.github.huluti.Curtail \
	com.github.liferooter.textpieces \
	com.github.tchx84.Flatseal \
	com.github.wwmm.easyeffects \
	com.mattjakeman.ExtensionManager \
	com.moonlight_stream.Moonlight \
	io.bassi.Amberol \
	net.scribus.Scribus \
	org.audacityteam.Audacity \
	com.obsproject.Studio \
	org.gnome.Epiphany \
	org.gnome.Calendar \
	org.gustavoperedo.FontDownloader \
	org.kde.kdenlive \
	org.keepassxc.KeePassXC \
	org.pulseaudio.pavucontrol \
	com.usebottles.bottles \
	org.gimp.GIMP \
	org.videolan.VLC \
	net.mullvad.MullvadBrowser \
	com.raggesilver.BlackBox
