
HASH=`git rev-parse --short HEAD`
TAG=redisearchjson:$HASH
IMAGE="vunamhung/$TAG"

echo "Building $IMAGE..."
docker build -t "$TAG" --build-arg "REDIS_PASSWORD=$REDIS_PASSWORD" .
