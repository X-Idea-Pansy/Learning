# Problème VM: Error starting domain: Requested operation is not valid: network 'default' is not active

## Traceback (most recent call last):
##   File "/usr/share/virt-manager/virtManager/asyncjob.py", line 67, in cb_wrapper
##     callback(asyncjob, *args, **kwargs)
##     ~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
##   File "/usr/share/virt-manager/virtManager/asyncjob.py", line 101, in tmpcb
##     callback(*args, **kwargs)
##     ~~~~~~~~^^^^^^^^^^^^^^^^^
##   File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", line 57, in newfn
##     ret = fn(self, *args, **kwargs)
##   File "/usr/share/virt-manager/virtManager/object/domain.py", line 1446, in startup
##     self._backend.create()
##     ~~~~~~~~~~~~~~~~~~~~^^
##   File "/usr/lib64/python3.14/site-packages/libvirt.py", line 1395, in create
##     raise libvirtError('virDomainCreate() failed')
## libvirt.libvirtError: Requested operation is not valid: network 'default' is not active
https://askubuntu.com/questions/1036297/cant-start-kvm-guest-network-default-is-not-active/1120132#1120132

root@doe:~# virsh net-list --all
 Name      State      Autostart   Persistent
----------------------------------------------
 default   inactive   yes         yes

root@doe:~# nmcli c delete virbr0
Connection 'virbr0' (0462f3c6-4090-44b8-bd52-7b65baf2c91c) successfully deleted.
root@doe:~# virsh net-start default
Network default started

root@doe:~# virsh net-list --all
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes

# VM plus de connexion réseau

sudo nano /etc/libvirt/network.conf
sudo nft flush ruleset
sudo firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -i virbr0 -o wlp3s0 -j ACCEPT
sudo firewall-cmd --reload

### Peut plus démarrer la VM

sudo systemctl status virtnetworkd
● virtnetworkd.service - libvirt network daemon
     Loaded: loaded (/usr/lib/systemd/system/virtnetworkd.service; disabled; preset: disabled)
    Drop-In: /usr/lib/systemd/system/service.d
             └─10-timeout-abort.conf
     Active: active (running) since Sat 2026-07-18 05:16:36 +04; 13min ago
 Invocation: 580ebafc66d140b3bed68393e34efa02
TriggeredBy: ● virtnetworkd-ro.socket
             ● virtnetworkd-admin.socket
             ● virtnetworkd.socket
       Docs: man:virtnetworkd(8)
             https://libvirt.org/
   Main PID: 8494 (virtnetworkd)
      Tasks: 19 (limit: 38274)
     Memory: 5.6M (peak: 8.5M)
        CPU: 160ms
     CGroup: /system.slice/virtnetworkd.service
             └─8494 /usr/bin/virtnetworkd --timeout 120

Jul 18 05:16:36 doe systemd[1]: Starting virtnetworkd.service - libvirt network daemon...
Jul 18 05:16:36 doe systemd[1]: Started virtnetworkd.service - libvirt network daemon.
Jul 18 05:16:36 doe virtnetworkd[8494]: libvirt version: 12.0.0, package: 3.fc44 (Fedora Project, 2026-01-26-10:19:53, )
Jul 18 05:16:36 doe virtnetworkd[8494]: hostname: doe
Jul 18 05:16:36 doe virtnetworkd[8494]: internal error: Network is already in use by interface virbr0

idea@doe:~$ sudo systemctl status virtqemud
● virtqemud.service - libvirt QEMU daemon
     Loaded: loaded (/usr/lib/systemd/system/virtqemud.service; enabled; preset: enabled)
    Drop-In: /usr/lib/systemd/system/service.d
             └─10-timeout-abort.conf
     Active: active (running) since Sat 2026-07-18 05:16:29 +04; 14min ago
 Invocation: 7f5d139f92f7406a9b1cc73cf55b20a6
TriggeredBy: ● virtqemud-ro.socket
             ● virtqemud.socket
             ● virtqemud-admin.socket
       Docs: man:virtqemud(8)
             https://libvirt.org/
   Main PID: 8309 (virtqemud)
      Tasks: 19 (limit: 32768)
     Memory: 18M (peak: 19.8M)
        CPU: 1.181s
     CGroup: /system.slice/virtqemud.service
             └─8309 /usr/bin/virtqemud --timeout 120

Jul 18 05:16:29 doe systemd[1]: Starting virtqemud.service - libvirt QEMU daemon...
Jul 18 05:16:29 doe systemd[1]: Started virtqemud.service - libvirt QEMU daemon.

idea@doe:~$ sudo virsh net-start default
error: Failed to start network default
error: internal error: Network is already in use by interface virbr0

idea@doe:~$ ip link show virbr0
8: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default qlen 1000
    link/ether 06:85:de:77:7c:c0 brd ff:ff:ff:ff:ff:ff
idea@doe:~$ sudo virsh net-info default
Name:           default
UUID:           eab0aa2d-63ae-40f6-b7cb-95dd6fe4dc27
Active:         no
Persistent:     yes
Autostart:      yes
Bridge:         virbr0

idea@doe:~$ bridge link
idea@doe:~$ ip addr show virbr0
8: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 06:85:de:77:7c:c0 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global noprefixroute virbr0
       valid_lft forever preferred_lft forever
idea@doe:~$ sudo ip link delete virbr0
idea@doe:~$ ip link show virbr0
9: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default qlen 1000
    link/ether de:2e:a5:3c:e5:08 brd ff:ff:ff:ff:ff:ff

### NetworkManager gère lui-même un pont nommé virbr0, alors que libvirt veut aussi créer un pont nommé virbr0. Les deux entrent en conflit.

sudo ip link delete virbr0

### NetworkManager détecte que "sa" connexion virbr0 a disparu et la recrée immédiatement. Ensuite, lorsque libvirt exécute :

sudo virsh net-start default

### il voit que virbr0 existe déjà et répond : Network is already in use by interface virbr0

sudo nmcli connection delete virbr0
nmcli connection show # -> plus virbr0
sudo virsh net-start default # start libvirt
sudo virsh net-list # check

## toujours pas de connection dans VM mais elle s'ouvre à nouveau

idea@doe:~$ sudo firewall-cmd --zone=libvirt --list-all
libvirt (active)
  target: ACCEPT
  ingress-priority: 0
  egress-priority: 0
  icmp-block-inversion: no
  interfaces: virbr0
  sources: 
  services: dhcp dhcpv6 dns ssh tftp
  ports: 
  protocols: icmp ipv6-icmp
  forward: no # -> PBM
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	rule priority="32767" reject

### Action

sudo firewall-cmd --permanent --zone=libvirt --set-target=ACCEPT
sudo firewall-cmd --permanent --zone=libvirt --add-forward
sudo firewall-cmd --reload

idea@doe:~$ sudo firewall-cmd --zone=libvirt --list-all # Check
libvirt (active)
  target: ACCEPT
  ingress-priority: 0
  egress-priority: 0
  icmp-block-inversion: no
  interfaces: virbr0
  sources: 
  services: dhcp dhcpv6 dns ssh tftp
  ports: 
  protocols: icmp ipv6-icmp
  forward: yes # better
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	rule priority="32767" reject

idea@doe:~$ sudo virsh net-destroy default
sudo virsh net-start default
Network default destroyed

Network default started

### Toujours pas de connexion

idea@doe:~$ sudo firewall-cmd --permanent --zone=libvirt --add-masquerade
success
idea@doe:~$ sudo firewall-cmd --reload
success
idea@doe:~$ sudo firewall-cmd --zone=libvirt --list-all
libvirt (active)
  target: ACCEPT
  ingress-priority: 0
  egress-priority: 0
  icmp-block-inversion: no
  interfaces: virbr0
  sources: 
  services: dhcp dhcpv6 dns ssh tftp
  ports: 
  protocols: icmp ipv6-icmp
  forward: yes
  masquerade: yes
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 
	rule priority="32767" reject

### Toujours pas de connexion

sudo firewall-cmd --direct --permanent --add-rule ipv4 filter FORWARD 0 -i wlp3s0 -o virbr0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo firewall-cmd --reload # ajout du retour vers KALI, seul envoi autorisé

## Connexion OK

idea@doe:~$ sudo tcpdump -ni wlp3s0 icmp
dropped privs to tcpdump
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on wlp3s0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
06:49:22.306759 IP 192.168.1.244 > 8.8.8.8: ICMP echo request, id 56765, seq 1, length 64
06:49:22.322958 IP 8.8.8.8 > 192.168.1.244: ICMP echo reply, id 56765, seq 1, length 64
06:49:23.308744 IP 192.168.1.244 > 8.8.8.8: ICMP echo request, id 56765, seq 2, length 64
06:49:23.324448 IP 8.8.8.8 > 192.168.1.244: ICMP echo reply, id 56765, seq 2, length 64
06:49:24.310315 IP 192.168.1.244 > 8.8.8.8: ICMP echo request, id 56765, seq 3, length 64
06:49:24.326454 IP 8.8.8.8 > 192.168.1.244: ICMP echo reply, id 56765, seq 3, length 64
^C
6 packets captured
6 packets received by filter
0 packets dropped by kernel
idea@doe:~$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address          Hostname   Client ID or DUID
-----------------------------------------------------------------------------------------------------------
 2026-07-18 07:34:20   52:54:00:2e:7f:fa   ipv4       192.168.122.13/24   kali       01:52:54:00:2e:7f:fa

idea@doe:~$ sudo tcpdump -ni virbr0 icmp
dropped privs to tcpdump
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
06:51:35.229816 IP 192.168.122.13 > 8.8.8.8: ICMP echo request, id 56766, seq 1, length 64
06:51:35.246101 IP 8.8.8.8 > 192.168.122.13: ICMP echo reply, id 56766, seq 1, length 64
06:51:36.231788 IP 192.168.122.13 > 8.8.8.8: ICMP echo request, id 56766, seq 2, length 64
06:51:36.247612 IP 8.8.8.8 > 192.168.122.13: ICMP echo reply, id 56766, seq 2, length 64
06:51:37.233581 IP 192.168.122.13 > 8.8.8.8: ICMP echo request, id 56766, seq 3, length 64
06:51:37.250034 IP 8.8.8.8 > 192.168.122.13: ICMP echo reply, id 56766, seq 3, length 64
06:51:45.044233 IP 192.168.122.13 > 8.8.8.8: ICMP echo request, id 56767, seq 1, length 64
06:51:45.060521 IP 8.8.8.8 > 192.168.122.13: ICMP echo reply, id 56767, seq 1, length 64
06:51:46.045487 IP 192.168.122.13 > 8.8.8.8: ICMP echo request, id 56767, seq 2, length 64
06:51:46.057722 IP 8.8.8.8 > 192.168.122.13: ICMP echo reply, id 56767, seq 2, length 64
06:51:47.047560 IP 192.168.122.13 > 8.8.8.8: ICMP echo request, id 56767, seq 3, length 64
06:51:47.063393 IP 8.8.8.8 > 192.168.122.13: ICMP echo reply, id 56767, seq 3, length 64
06:51:48.049201 IP 192.168.122.13 > 8.8.8.8: ICMP echo request, id 56767, seq 4, length 64
06:51:48.066322 IP 8.8.8.8 > 192.168.122.13: ICMP echo reply, id 56767, seq 4, length 64
^C
14 packets captured
14 packets received by filter
0 packets dropped by kernel
