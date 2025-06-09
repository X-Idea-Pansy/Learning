# Infra prête pour prod

<https://youtu.be/SXv9JCCUqXQ?list=TLPQMDkwNjIwMjW5zRUFJzhqAA>
Base de données= bas niveau, optimisé
Application= goulot d'étranglement

## Basique

serveur:
-> site dessus, reste allumé tout le temps pour être accessible par utilisateurs
-> augmenter qualité de serveur : a ses limites, cher

## Improve 1 : squaling vertical

2 serveurs:

* 1 pour l'application
* 1 pour database
-> se répartir les ressources

## Improve 2 : Squaling horizontal

Plus de serveurs, chacun s'occupe d'un certain nombre d'utilisateurs
-> question de la répartition des utilisateurs
-> Serveur: Load balancer
    -> équilibreur de charge
    -> rediriger sans regarder contenu : peu de ressources

    * Round robin (dans l'ordre de serveurs)
    * équilibrer charge, connecter toujours au même serveur, etc

## Improve 3 : SPOF

* Single Point Of Failure SPOF

application (stateless) -> augmenter nb de serveurs, pas de comm entre eux, changepas fonctionnement
load balancer -> redonder
Base de données (stateful) -> sharding -> découper données -> partie des utilisateurs par database
-> compliqué avec database type SQL

### Cas SQL

* plus souvent de la lecture que écriture
-> serveur base de données principal -> écriture -> synchro avec les autres databases
-> autres -> lecture
