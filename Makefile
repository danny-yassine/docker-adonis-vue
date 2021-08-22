build:
	docker-compose build --parallel
build-no-cache:
	docker-compose build --parallel --no-cache
build-api:
	docker-compose build api
build-client:
	docker-compose build client
build-mysql:
	docker-compose build mysql
build-daemon:
	docker-compose up -d --build
dev:
	docker-compose up
dev-daemon:
	docker-compose up -d
down:
	docker-compose down
api-ssh:
	docker exec -it docker-adonis-api /bin/bash
client-ssh:
	docker exec -it docker-adonis-api /bin/bash
migrate:
	docker exec -it docker-adonis-api node ace migration:run --force
setup:
	make build
	make dev-daemon
	make post-setup
post-setup:
	dev-env/setup.sh
build-deploy-api:
	docker build -f ./api.deploy.dockerfile -t docker-adonis-vue:1.0.0 .
run-deploy-api:
	docker run --name api-deploy -p 8000:8000 docker-adonis-vue:1.0.0
# test-api:
# 	docker exec docker-adonis-api /usr/src/api/vendor/bin/apiunit \
# 	--configuration /usr/src/api/apiunit.xml \
# 	--colors=auto