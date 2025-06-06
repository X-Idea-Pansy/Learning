# PROTOCOLES

Source: <https://www.lemagit.fr/conseil/Reseau-comprendre-les-14-protocoles-essentiels>

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

    MAC: Media Access Control _ unique ID _ comm. entre (1 physique) et (3 réseau) modèle OSI _ Ethernet et Wi-Fi, technologies de réseau IEEE 802 
      -> identifier de manière unique un élément matériel spécifique
      -> ident devices on a network
      -> MAC est codée en dur dans le matériel d'un appareil et ne peut pas être modifiée, stockées dans le micrologiciel du périphérique

    IP: Internet Protocol _ logical ID : network ID + host ID 
      -> identifier un périphérique sur un réseau
      -> locate a device on a network
      -> peut être attribuée de manière dynamique ou statique et peut changer au fil du temps, généralement attribuées par votre FAI (fournisseur d'accès Internet)
      * IPv4 : 192.168.1.1
      * IPv6 : 2001:0db8:85a3:0000:0000:8a2e:0370:7334 -> huit groupes de quatre chiffres hexadécimaux

      Dans un réseau : appareil cherche IP -> demande à tous sur réseau
                       réponse de l'appareil portant cette IP avec adresse MAC -> adressage direct
                       ajout IP + MAC associés dans cache pour aller plus vite ensuite
                       dynamic ou static, dynamic nettoyé régulièrement

### BGP, passerelle entre les frontières _ Border Gateway Protocol

* AS = Automous System -> "bulle" internet qui regroupe les réseaux locaux (exemple entreprise)
* BGP externe = gère flux de paquets passant sur routeur entre AS et internet global
* BGP interne = gère flux de paquets passant sur routeur entre réseaux locaux dans un AS

* LAN = local area networks
* WAN = wide area networks -> majoritaire

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

### HTTP, transfert hypertexte _ Hypertext Transfer Protocol

* TCP/IP based -> initial connection and after reconnection
  -> deliver access to content
* connectionless - server disconnects client then reconnects with response
* every type of data if both ends can read those
* stateless : sever and device know about each other during time of request, not after
* _couche 7 "Application" ISO model_
