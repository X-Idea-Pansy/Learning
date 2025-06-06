
# Notes linux

wsl access windows userfile

## Généralités Ubuntu

Mettre à jour le cache et les **paquets**

```shell
sudo apt-get update && sudo apt-get upgrade
```

### Commandes

`pwd` = print working directory
`cd`= change directory
`cd ../`= revenir en arrière dans le dossier source
`ls -a`= afficher tout dans dossier
`cat /etc/group` = voir groupes et utilisateurs
`sudo apt-get install python` = installer package
drwxr-xr-x = droits pour 3 types de groupes par 3 caractères : read, write, execute

* d -> dossier
* owner : 3 premiers caractères
* groupe
* reste

`id` =`whoami`
`sudo -i` = devenir root -> mefiat

`ln -s /mnt/c/Users/Utilisateur/Coding ./Coding`créer lien entre dossier existant à nouveau dossier dans dossier courant

`curl` -> client http

### Users /VS/ Réseau

`ip addr` = lister interfaces réseau

* lo 127.0.0.1/8 -> local loop back : IP locale de la machine interrogée vis à vis d'elle-même
* eth0 172.17.170.151/20 -> IP publique
* action au travers d'ubuntu sera identifiée via IP publique -> pas un espion

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever

2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:15:5d:9b:4e:b3 brd ff:ff:ff:ff:ff:ff
    inet 172.17.170.151/20 brd 172.17.175.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::215:5dff:fe9b:4eb3/64 scope link
       valid_lft forever preferred_lft forever

## K3S

(distribution kubernetes légère)

Editeur: rancher
[documentation](https://docs.k3s.io/)

### Installation

#### Serveur

#### Client`

```shell
[kubectl]()
```

### Interraction

Vérifier que le service tourne

```shell
sudo systemctl status k3s.service
```
