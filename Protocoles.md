# PROTOCOLES

Sources:
<https://www.lemagit.fr/conseil/Reseau-comprendre-les-14-protocoles-essentiels>
<https://www.youtube.com/watch?v=1zVZ9cWFnCc&t=26s>

## Sommaire

* Protocoles de communication
  * résolution d’adresses (ARP)
  * transfert hypertexte (HTTP)
  * Internet (IP)
  * transfert de courrier simple (SMTP)
  * contrôle du transport (TCP)
  * datagramme de l’utilisateur (UDP)

* Protocoles de routage
  * Border Gateway Protocol (BGP)
  * Open Shortest Path First (OSPF)

* Protocoles de gestion de réseau
  * système de noms de domaine (DNS)
  * configuration dynamique des hôtes (DHCP)
  * transfert de fichiers (FTP)
  * messages de contrôle Internet (ICMP)
  * gestion de réseau simple (SNMP)
  * Telnet

## Protocoles de communication

### ARP, résolution d’adresses _ Address Resolution Protocol

    convert adresses IP <-> adresses MAC : comm. entre appareils du réseau local
    * adresses avec longueurs diff
    * adresses fonctionnent sur couches diff du modèle OSI

    MAC: Media Access Control _ unique ID 
    * comm. entre (1 physique) et (3 réseau) modèle OSI _ Ethernet et Wi-Fi, technologies de réseau IEEE 802 
      -> identifier de manière unique un élément matériel spécifique
      -> ident devices on a network
      -> MAC est codée en dur dans le matériel d'un appareil 
      -> peut pas être modifiée, stockées dans le micrologiciel du périphérique

    IP: Internet Protocol _ logical ID : network ID + host ID 
      -> identifier un périphérique sur un réseau
      -> locate a device on a network
      -> peut être attribuée de manière dynamique ou statique 
      -> peut changer au fil du temps, généralement attribuées par votre FAI (fournisseur d'accès Internet)
      * IPv4 : 192.168.1.1
      * IPv6 : 2001:0db8:85a3:0000:0000:8a2e:0370:7334 -> huit groupes de quatre chiffres hexadécimaux

      Dans un réseau : appareil cherche IP -> demande à tous sur réseau
                       réponse de l'appareil portant cette IP avec adresse MAC -> adressage direct
                       ajout IP + MAC associés dans cache pour aller plus vite ensuite
                       dynamic ou static, dynamic nettoyé régulièrement

### HTTP, transfert hypertexte _ Hypertext Transfer Protocol

* TCP/IP based -> initial connection and after reconnection
  -> deliver access to content
  -> accès à contenu d'un nom de domaine d'un site
* connectionless - server disconnects client then reconnects with response
* every type of data if both ends can read those
* stateless : sever and device know about each other during time of request, not after
* _couche 7 "Application" ISO model_

### IP, Internet _ Internet Protocol

* paquets = comme des lettres avec deux adresses IP : une pour l’expéditeur et une pour le destinataire
* le protocole IP envoie les paquets à leur destination, le plus rapidement possible
* le protocole TCP organise les paquets dans le bon ordre

### SMTP, transfert de courrier simple _ Simple Mail Transport Protocol

-> _protocole de messagerie électronique le plus populaire_

* SMTP ne contrôle pas la façon dont les clients de messagerie reçoivent les messages, mais seulement la façon dont ils les envoient
-> SMTP peut fonctionner avec Post Office Protocol 3 (POP3) ou Internet Message Access Protocol (IMAP), qui contrôlent la manière dont un serveur de messagerie reçoit les messages électroniques

### TCP, contrôle de transmission _ Transmission Control Protocol

* organise les paquets dans l’ordre pour que le protocole IP puisse les acheminer
* TCP détecte également les erreurs dans le processus d’envoi – notamment si des paquets sont manquants d’après le système de numérotation de TCP
* diff avec UDP : rapide mais pertes de paquets

### UDP, datagramme utilisateur _ User Datagram Protocol

* transmissions de données à faible latence entre les applications Internet
* Contrairement à TCP, UDP n’attend pas l’arrivée de tous les paquets et n’organise pas les paquets
-> UDP transmet uniquement des paquets, tandis que TCP transmet, organise et s’assure que les paquets arrivent

## Protocoles de routage

### BGP, passerelle entre les frontières _ Border Gateway Protocol

* AS = Automous System -> "bulle" internet qui regroupe les réseaux locaux (exemple entreprise)
* BGP externe = gère flux de paquets passant sur routeur entre AS et internet global
* BGP interne = gère flux de paquets passant sur routeur entre réseaux locaux dans un AS

* LAN = local area networks
* WAN = wide area networks -> majoritaire

### OSPF, le chemin ouvert le plus court d’abord _ Open Shortest Path First

* OSPF ouvre le chemin le plus court, ou le plus rapide, en premier pour les paquets
-> similaire à Routing Information Protocol (dirige trafic en fonction du nombre de sauts qu’il doit effectuer le long d’un itinéraire)
-> alternative plus rationnelle et plus évolutive au RIP : RIP envoie des tables de routage mises à jour toutes les 30 secondes, alors qu’OSPF n’envoie des mises à jour que lorsque c’est nécessaire

## Protocoles de gestion de réseau

### DNS, le système de noms de domaine _ Domain name system

-> site web = nom de domaine = adresse IP
  utilisateur -> cherche nom de domaine (hostname)
  serveur DNS -> convertit nom de domaine en IP (via cache/local browser < recursive resolver)
              -> cherche IP

### DHCP, configuration dynamique des hôtes _ Dynamic Host Configuration Protocol

  appareil première connexion à un réseau
  -> distributeur d'IP
  handshake avec serveur qui propose adresse IP et options, appareil choisit, serveur valide

* adresse IP static -> config manuelle
  
### FTP, transfert de fichiers _ File Transfer Protocol

* control connection (port 21) : `get, put, ls, cd`
* data connection (port 20)
* FTP = without encryption : not secured
  * SFTP_SSH File Transfer Protocol (port 22)
  * FTPS_FTP Secure : SSL or TLS encryption
* _secteur bancaire_

### ICMP, messages de contrôle Internet _ Internet Control Message Protocol

* _couche "reseau" ISO model (3eme)_
-> utilisé par `ping` and `traceroute` (identify the path between a source and a destination point)
-> gestion des erreurs, les diagnostics et les messages de contrôle entre les appareils
-> identifier les problèmes de connectivité
Most often:
* Echo Request (demande d’écho) et Echo Reply (réponse d’écho).
* Destination Unreachable (Destination inaccessible).
* Time Exceeded (Délai dépassé).
* Redirect Message (Message de redirection).

### SNMP, administration réseau simple _ Simple Network Management Protocol

* gérer et surveiller les appareils du réseau
* détecter et résoudre les problèmes de réseau

### Telnet

* connexions entre un appareil distant et une machine hôte pour permettre une session à distance
* permet à l’utilisateur d’accéder aux ressources du réseau et aux données de l’ordinateur hôte
* pas des protections de sécurité sophistiquées : désuet
