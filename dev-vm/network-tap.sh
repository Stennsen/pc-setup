#!/bin/bash

nmcli connection add type tun ifname tap0 con-name tap0 mode tap owner `id -u`
