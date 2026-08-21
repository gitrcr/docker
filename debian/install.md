```bash
sudo su
touch /etc/sysctl.d/99-swappiness.conf
echo "vm.swappiness=10" >> /etc/sysctl.d/99-swappiness.conf
sysctl --system
sysctl vm.swappiness
```
