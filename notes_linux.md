
# Notes linux

wsl access windows userfile

## Généralités Ubuntu

Mettre à jour le cache et les **paquets**

```shell
sudo apt-get update && sudo apt-get upgrade
```

### Commandes

   `pwd` = print working directory

#### cd

   `cd`= change directory
   `cd [Option] [Répertoire]`
`cd nameofFile/` -> go to file
`cd /` répertoire racine
`cd /Desktop`
`cd ..` -> go back
`cd ../`= revenir en arrière dans le dossier source

#### cat

`cat /etc/group` = voir groupes et utilisateurs
`sudo apt-get install python` = installer package

#### ID

`id` =`whoami`
`sudo -i` = devenir root -> mefiat

#### create

   `ln -s /mnt/c/Users/Utilisateur/Coding ./Coding`créer lien entre dossier existant à nouveau dossier dans dossier courant

##### cp _ Copy

`cp [Original] [Destination]`
`cp text.txt /home/utilisateur/dossierdedestination/`

##### mv _ move

`mv -i` -> demande confirmation avant d'écraser
`mv -n`-> ne pas écraser si conflit

* Files
`mv [Option] [Fichier d’origine] [Fichier de destination]`
`mv /home/flo/Dessins.txt /tmp/` -> déplacer le fichier Dessins.txt vers le répertoire "/tmp"
`mv client.txt ~/Documents/Contacts/`
`mv *.txt /Documents/` -> déplacer tous les fichiers se terminant pas .txt vers le dossier /Documents/
`mv Dessins* /tmp/` -> déplacer tous les fichiers commençant par "Dessins"
`mv Factures anciennes_factures` -> renommer !!!

* Folder / directory
`mv data1/* /tmp/` -> Déplacer le contenu du dossier mais pas dossier
`mv /home/flo/data/ /tmp/` -> déplace ce répertoire vers /tmp/
`mv data2021/ data2022/` -> renommer !!!
    -i ou –interactive : elle permet de garantir que le système « demande » si un fichier ou un répertoire doit ou non être écrasé.
    -u ou –update : elle permet de veiller à ce qu’un fichier d’origine soit uniquement déplacé si le fichier de destination est plus ancien.
    -v ou –verbose : elle permet d’afficher l’état de progression du déplacement.
`mv $(ls --ignore=Dessins2.txt)` -> tout déplacer sauf le fichier "Dessins2.txt"

##### Create files

* mkdir _ make directory
`mkdir Dessins` -> creates folder in current directory
* touch
`touch [options] file_name` -> create empty file in current directory
`touch File1_name File2_name File3_name` -> multiple files
* cat
`cat > empty_file.txt` -> create empty file in current directory
`cat empty_file.txt` -> display content of file !!!
* > _ only for some shells with this syntax (bash exemple)
`> filename`
`> /path/to/filename`

#### Remove

`rmdir`_remove empty directory
`rm -rf`_remove directory
`clear`_clear terminal

##### vim _ éditeur de texte

Once you are in insert mode, press `Esc` to return to command mode.
To save your changes and exit Vim, type `:wq` and press `Enter`.
`:` enters command-line mode.
`w` stands for write (save).
`q` stands for quit.

`curl` -> client http

#### Listing

`ls` -> list what is inside current folder
`ll` or `ls - l` -> long listing command
`ls -a`= afficher tout dans dossier

### Lecture infos

drwxr-xr-x = droits pour 3 types de groupes par 3 caractères : read, write, execute

* d -> dossier
* owner : 3 premiers caractères
* groupe
* reste

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
