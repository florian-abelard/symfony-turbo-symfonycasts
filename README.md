# docker-starter-kit

##Description 

Starter kit Docker pour créer des applications basées sur une stack PHP / PostgreSQL

## Démarrage

### Pré-requis

* docker
* docker-compose (version 3)

### Usage

#### Initialisation du projet

```bash
APPLICATION_NAME='<application_name>' # A définir

git clone git@github.com:florian-abelard/docker-starter-kit.git $APPLICATION_NAME
cd $APPLICATION_NAME

rm -Rf .git/
git init

git remote add origin git@github.com:florian-abelard/$APPLICATION_NAME.git
```

Modifier le fichier `README.md`

```bash
git add .
git commit -a -m "Initial commit"
```

#### Démarrage des containers docker

Editer le fichier `.env`, puis : 
```bash
make up
```

### Avec symfony

```bash
rm application/* -Rf

docker run --rm \
    -v ${PWD}:/var/www/app \
    -w /var/www/app \
    composer:latest \
    create-project symfony/website-skeleton:"^4.4" application

sudo chown ${USER}. application/ -R 

# A compléter
```

### Accès

Accès interface web sur `http://localhost:8080`

Accès adminer sur `http://localhost:8081`
