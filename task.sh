# 1. remove if exist and create network which will be in use
docker network rm my-bridge-network
docker network create -d bridge my-bridge-network

# 2. let our scripts exec permission
chmod +x server/server_script.sh client/client_script.sh

# 3. remove if exist and build images
docker image rm -f client_image server_image
docker build -t server_image -f server/Dockerfile .
docker build -t client_image -f client/Dockerfile .

# 4. remove if exist and run containers
docker container rm -f server_container client_container
docker run -d --network my-bridge-network --name server_container -v $(pwd)/server:/app server_image
sleep 2
docker run -d --network my-bridge-network --name client_container -v $(pwd)/client:/app client_image
