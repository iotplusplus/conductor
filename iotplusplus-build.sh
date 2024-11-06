# Azure
az login
sudo az acr login --name iotplusplusacr01
VERSION=1.1
PLATFORM=linux/amd64
MODULE=conductor
sudo docker buildx build --platform $PLATFORM -t iotplusplusacr01.azurecr.io/$MODULE:$VERSION -f docker/server/Dockerfile --push .

# AWS
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 637423396561.dkr.ecr.us-east-1.amazonaws.com
VERSION=1.3
PLATFORM=linux/amd64
MODULE=conductor
sudo docker buildx build --platform $PLATFORM -t $MODULE:$VERSION -f iotplusplus-docker/server/Dockerfile --load .
sudo docker tag $MODULE:$VERSION 637423396561.dkr.ecr.us-east-1.amazonaws.com/iotplusplus/$MODULE:$VERSION
sudo docker push 637423396561.dkr.ecr.us-east-1.amazonaws.com/iotplusplus/$MODULE:$VERSION

