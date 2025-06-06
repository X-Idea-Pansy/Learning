# PROTOCOLES

## Protocoles de communication:

* résolution d’adresses (ARP)
* transfert hypertexte (HTTP)
* Internet (IP)
* transfert de courrier simple (SMTP)
* contrôle du transport (TCP)
* datagramme de l’utilisateur (UDP)

## Protocoles de routage:

* Border Gateway Protocol (BGP) 
* Open Shortest Path First (OSPF)

## Protocoles de gestion de réseau:

* système de noms de domaine (DNS)
* configuration dynamique des hôtes (DHCP)
* transfert de fichiers (FTP)
* messages de contrôle Internet (ICMP)
* gestion de réseau simple (SNMP)
* Telnet

### Protocoles de communication:

#### ARP, le protocole de résolution d’adresses _ ARP (Address Resolution Protocol)

    convert adresses IP <-> adresses MAC : comm. entre appareils du réseau local
    * adresses avec longueurs diff
    * adresses fonctionnent sur couches diff du modèle OSI

    MAC: Media Access Control _ unique ID _ comm. entre (1 physique) et (3 réseau) modèle OSI _ Ethernet et Wi-Fi, technologies de réseau IEEE 802 
      -> identifier de manière unique un élément matériel spécifique
      -> MAC est codée en dur dans le matériel d'un appareil et ne peut pas être modifiée, stockées dans le micrologiciel du périphérique

    IP: Internet Protocol _ logical ID : network ID + host ID 
      -> identifier un périphérique sur un réseau
      -> peut être attribuée de manière dynamique ou statique et peut changer au fil du temps, généralement attribuées par votre FAI (fournisseur d'accès Internet)
      * IPv4 : 192.168.1.1
      * IPv6 : 2001:0db8:85a3:0000:0000:8a2e:0370:7334 -> huit groupes de quatre chiffres hexadécimaux
