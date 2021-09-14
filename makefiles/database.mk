#------------------------------------------------------------------------------
# Database Makefile
# 	- with doctrine
#------------------------------------------------------------------------------

database-admin-exec = docker-compose -f ${DOCKER_COMPOSE_FILE} exec -T --user root db ${1}
database-doctrine-exec = docker-compose -f ${DOCKER_COMPOSE_FILE} exec -T --user ${USER_ID} php ${1}

#------------------------------------------------------------------------------

db-init: db-create db-fixtures ##@database create and populate database

db-create: db-drop ##@database create the database
	$(call database-doctrine-exec, php bin/console doctrine:database:create)
	$(call database-doctrine-exec, php bin/console doctrine:schema:create)

db-drop: ##@database drop the database
	$(call database-doctrine-exec, php bin/console doctrine:database:drop --if-exists --force)

db-fixtures: ##@database run the database fixtures
	$(call database-doctrine-exec, php bin/console doctrine:fixtures:load --no-interaction)

db-create-migration: ##@database create a new migration file
	$(call database-doctrine-exec, php bin/console doctrine:migrations:diff)

db-schema-update:
	$(call database-doctrine-exec, php bin/console doctrine:schema:update --force)

db-wait-for:
	sh bin/wait-for-db.sh

#------------------------------------------------------------------------------

clean-db: db-drop ##@database clean database

#------------------------------------------------------------------------------

.PHONY: db-init db-create db-drop db-migrate db-create-migration db-schema-update db-wait-for clean-db
