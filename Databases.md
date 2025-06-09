
# Databases

<https://youtu.be/080p5Y2_wpg>

## Relationnelles (SQL)

* beaucoup de lignes
* financier
* SQL = Structure Query Language
* pour données tabulaires, dans des cellules
* pratique pour transactions
* compliqué de distribuer données sur plusieurs serveurs -> mauvaise scalabilité

Index
-> nv commande -> table secondaire indexée pour aller plus vite

## En colonnes / Columnat ou Wide Column database

* beaucoup de colonnes
* statistiques, mauvais pour tout le reste
* Cassandra, Hbase, Bigquery, redshift (amazon)
* permet de sélectionner une catégorie de données juste en récupérant les valeurs d'une ligne
-> moins de données à récupérer lors d'une query
* Séparation des données plus simple

## Orientées documents (Json Objects)

* tabulaire, pas nécessairement données sensibles, besoin de scaler
* Mongodb, Couchbase, Documentdb, Couchbd
* rassembler plusieurs données dans une colonne
* plus de flexibilité: orga en début de création d'un logiciel
* pas de relations entre lignes -> scalabilité, distribution des données sur plusieurs machines
* schéma de données pas assez strict -> risque de corruption

## Clé-valeur / Key-value database

* récup data rapidement
* Redis, Memcached
* tout enregistrer en RAM = + rapide et + cher
* en général = cash devant base de donnée ou état d'avancement d'une requète avec "liste"

## Time Series (TSDB)

* Monitoring, bourse...
* Prometheus, Grafite, Influxdb
* Temps,valeur
* Toujours ajout, jamais modif
* stocker possibilité de distribuer (sharder), retenir difference de t à t+1 -> stocker - de valeurs = compression
* possibilité d'agréger pour anciennes valeurs, réduit précision

## Graph

* Neo4j(facebook), neptune(amazon), arangodb
* stocker des noeuds pour générer relations entre tables
-> pas aoir des boucles dans des boucles
* recommandations, réseaux sociaux, détection fraude

# Vectorielles

* AI, moteur de recherche 
-> associer numéro à mot pour faire une base de données 
-> rapprocher d'un point de vue numérique les concepts qui vont ensemble avec plusieurs dimensions (précision + contexte)
* stocker listes de nombres
* Pinecone, weaviate, qdrant
