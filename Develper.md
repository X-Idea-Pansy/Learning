# Developer

## Notions de base

<https://www.youtube.com/watch?v=mdxKBz5QUTo&list=TLPQMDgwNjIwMjX-9qshNRiMfQ&index=3>

### Plages réseaux (CIDR block)

1.2.3.4/32 -> 32 correspond à plage adresse IP finissant par même adresse
    -> 1 adresse IP
10.0.0.0/24 -> 10.0.0.1 - 10.0.0.255
    -> 255 IP
10.0.0.0/16 -> 10.0.0.1 - 10.0.255.255
    -> 255*255 IP
10.0.0.0/8 -> 10.0.0.1 - 10.255.255.255
    -> 255*255*255 IP

### IP

#### IP privées

IP privée: fonctionne dans réseau local
    -> il peut y avoir les mêmes adresses IP dans 2 réseaux locaux distincts

* 192.168.0.0/16 -> la plus courante
* 10.0.0.0/8 -> réseaux entreprise
* 172.16.0.0/12 -> (172.16.0.1 - 172.31.255.255)

IP spéciales:

* 127.0.0.0/8 localhost, comm interne à machine entre processeurs
* 169.254.0.0/16 auto private IP si réseau lui attribue pas d'IP, *faute de connection*
* (100.64.0.0/10 CGNAT Carrier Grade NAT -> VPN, detering)

#### IP publiques

toutes les autres

### Protocoles

-> voir Protocoles.md X-Idea-Pansy/Learning/Protocoles.md

#### DNS (port 53)

Enregistrements de différents types:

* A : nom = IP (IPv4)
* CNAME : nom = nom ... = IP (entre diff serveur jusqu'à trouver IP)

* AAAA : nom = IPv6 (nom de domaine)
* MX : nom = IP (mail)
* TXT : texte pour certifier provenance

`nslookup google.com` -> réponse dans non-autorithative answer

#### TCP nv 4 transport

les niveaux hauts utilisent la base des niveaux bas
utilisent TCP pour fiabilité = HTTP (port 80), SSH (port 22), FTP (port 21), POP
UDP = rapide
ICMP = ping, tracert, etc
`telnet google.com 80` se connecter sur un port avec connection machine -> TCP
`ping google.com` client ICMP
`traceroute google.com`

`netstat -tpnl` -> expliquer ligne de commande

* t commande TCP
* p montrer program qui fait cette communication
* n afficher adresses IP
* l montrer connections en écoute

#### HTTP

`telnet www.google.com 80` -> connection établie avec adresse IP
`GET / HTTP/1.1`
`Host: www.google.com` -> récupérer données de ce site. ENTER*2
erreurs : 200=ok, 301=redirection

`curl www.google.com -v` -> même chose mais résolution auto sans refaire requête si 301

HTTPS (avec TLS/SSL=ancien nom)
-> échange de clés = certificats -> authentifier + chiffrer

* load balancer (niveau 4:plus rapide ou 7:plus smart)
    -> redirige requete vers serveur
    -> plus rapide que serveur

### SUM UP

DNS : nslookup, dig
TCP : netstat/SS, ping, traceroute/tracert/tracepath(linux), telnet/netcat, tcpdump
HTTP : curl, wget, telnet
