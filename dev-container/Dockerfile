FROM opensuse/tumbleweed

RUN zypper update -y

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc && sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'

RUN zypper refresh && zypper install -y code podman podman-docker neovim nodejs19 npm19 git man info

RUN zypper update -y

RUN pip install envsubst podman-compose
