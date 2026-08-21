```bash
sudo su
touch /etc/sysctl.d/99-swappiness.conf
echo "vm.swappiness=10" >> /etc/sysctl.d/99-swappiness.conf
sysctl --system
sysctl vm.swappiness
```
```bash
VERSION_STRING=5:29.7.2-1~debian.13~trixie
sudo apt install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin docker-compose-plugin
```
