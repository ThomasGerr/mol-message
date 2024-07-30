docker-compose build

docker tag mol-message-frontend registry.digitalocean.com/pixlworks/mol-message-frontend
docker push registry.digitalocean.com/pixlworks/mol-message-frontend

docker tag mol-message-websocket registry.digitalocean.com/pixlworks/mol-message-websocket
docker push registry.digitalocean.com/pixlworks/mol-message-websocket