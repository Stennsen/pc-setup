FROM registry.fedoraproject.org/fedora-toolbox:latest

RUN dnf update -y;
RUN echo -e '\
[gitlab.com_paulcarroty_vscodium_repo]\n\
name=gitlab.com_paulcarroty_vscodium_repo\n\
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\n\
enabled=1\n\
gpgcheck=1\n\
repo_gpgcheck=1\n\
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg\n\
metadata_expire=1h\n\
' > /etc/yum.repos.d/vscodium.repo

RUN dnf install codium podman neovim -y

RUN codium --install-extension piousdeer.adwaita-theme\
codium --install-extension svelte.svelte-vscode\
codium --install-extension vscodevim.vim\
codium --install-extension ms-python.python\
codium --install-extension GitHub.vscode-pull-request-github\
codium --install-extension vscode.npm\
codium --install-extension redhat.java\
codium --install-extension redhat.vscode-xml\
codium --install-extension ms-vscode.vscode-typescript-next\
codium --install-extension bradlc.vscode-tailwindcss\
codium --install-extenion Kelvin.vscode-sshfs
