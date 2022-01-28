# Tuto symfony-turbo

## Description 

Application support pour le tutoriel 

https://symfonycasts.com/screencast/turbo

## Démarrage

### Pré-requis

* docker (version > 20.10)
* docker-compose (version 3)

### Mise en place de l'environnement

```bash
# Récupération des sources github
git clone https://github.com/florian-abelard/symfony-turbo-symfonycasts.git

# Initialisation du projet
make init

# Démarrer les containers docker
make up

# Créer et alimenter la base de données
make db-init

# Afficher toutes les commandes disponibles
make
```

## Accès

Accès interface web sur `http://localhost:8080`

Accès adminer sur `http://localhost:8081`
