ip addr add 192.168.10.10/24 dev enp0s8
ip link set enp0s8 up
systemctl disable firewalld.service
systemctl stop firewalld.service
