# Developer

## Notions de base

<https://www.youtube.com/watch?v=mdxKBz5QUTo&list=TLPQMDgwNjIwMjX-9qshNRiMfQ&index=3>

### Plages réseaux (CIDR block)

* 1.2.3.4/32 -> 32 correspond à plage adresse IP finissant par même adresse
    -> 1 adresse IP
* 10.0.0.0/24 -> 10.0.0.1 - 10.0.0.255
    -> 255 IP
* 10.0.0.0/16 -> 10.0.0.1 - 10.0.255.255
    -> 255*255 IP
* 10.0.0.0/8 -> 10.0.0.1 - 10.255.255.255
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

## Outils

<https://youtu.be/nmUBSX6BEak?list=TLPQMDkwNjIwMjW5zRUFJzhqAA>

### Gestion de config

* Ansible, Chef, puppet, saltstack

-> déployer autant de fois voulu la même recette initiale

-> passer le code à l'admin system pour qu'il le mette sur son serveur

### Conteneurisation

* docker, lxc, podman

-> créer conteneurs avec : code + dépendances + OS + librairies

-> toujours marcher de la même façon : ordi dev ou prod = pareil

### CICD Continous Integration Continuous Diployment

* Gitlab, jenkins, argo

-> système pipeline -> fait toutes les étapes pour créer conteneur -> automatique

### Orchestrateurs

* kubernetes, nomad

-> responsable pour attribuer à espace dispo

-> plusieurs microservices à gérer

    -> où les placer ? Sur quel serveur ? En fonction des besoins de chaque application

### Cloud

* où vivent les applis ?
* aws, google cloud patform, azure

-> avoir le bon nombre de serveur au bon moment
    -> adapter dynamiquement au nombre d'utilisateur

    -> pas avoir le max en continu : cher + gaspi

### Observabilité

* monitoring
* prometheus, grafana, elastic stack, data dog

-> inspecteur

-> surveiller certaines valeurs: utilisation disque dur, etc.

### développement web

<https://www.peexeo.com/publication/les-principales-notions-a-connaitre-en-developpement-web>

#### HyerText Markup Language, HTML

* langage de base d'un site internet, balisage pour écrire hypertexte pour définir structure sémantique page web
* docs contenant des infos liées entre elles par des hyperliens (href)
* permet ajout titres, listes à puces, formulaires, images.

#### Cascade Style Sheet, CSS

* langage -> définir la forme à donner à document
* couleurs, marges, bordures et effet au survol d’éléments

#### JavaScript

* langage de programmation -> implémenter des mécanismes complexes sur une page web
* contrôles comme le fait de vérifier si un champ est bien rempli, l’affichage d’une alerte, la gestion d’effets visuels
* on utilise le Javascript dans du HTML. Les portions de code javascript étant délimitées par des balises spécifiques (<script> et </script>)
* ne pas confondre le Javascript et le JAVA

Permet
* Vérification de saisie dans des formulaires (Adresse, email)
* Calculs simples suite à des saisies de formulaire (Tarifs, calculatrice)
* Moteur de recherche (base de recherche définie par le webmaster)
* Gestion des dates et des heures (Date du jour, Date de mise à jour, Calendriers)
* Gestion des cookies (Sauvegarde d’information : nombre de visites, caddie virtuel)
* Gestion de la navigation (Menus dynamique, popup)
* Animations graphiques (Dynamic HTML, MouseOver, bannières rotatives, jeux)
* Création d’application web avec les appels Ajax vers le serveur
* Création de jeux

#### jQuery

* bibliothèque JavaScript gratuite, libre et multiplateforme
* framework JavaScript le plus connu et le plus utilisé

Avec jQuery, vous pouvez par exemple :
* Ajouter, supprimer ou modifier des éléments HTML au sein de votre page.
* Changer les styles des éléments de la page en modifiant le CSS qui leur est associé.
* Animer des éléments de votre page.
* Envoyer et recevoir des données depuis un serveur grâce à AJAX

#### PHP

* langage de script open source
* Le Javascript est exécuté côté client alors que le PHP, lui, est exécuté côté serveur.
* créer des sites Internet dynamiques, et, administrables par le biais de MySQL.

Voici différents exemples de ce que permet PHP :

* Automatiser la gestion d’articles ou autres éléments de votre site.
* Gérer le contenu de vos administrations.
* Gérer des galeries photos, des annuaires de liens, des sondages, des forums, des moteurs de recherche internes, etc …
* Mettre en place des fonctions de tri et hachage, le traitement de chaînes de caractères, la génération et la modification d’images, les algorithmes de compression, etc…
