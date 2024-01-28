### react-server-express

Is an express server from deploy react.js in server node.js

### Docker Hub

```
git tag v1.0.5 &&
git tags

npm version -f 1.0.5
docker build -t server . &&
docker tag server cgalvisleon/josephine:server &&
docker push cgalvisleon/josephine:server

- docker run -d --rm --name server-demo -p 3000:3000 cgalvisleon/josephine:server
- docker run -d --rm --name server-demo -p 3000:3000 -v $PDW/app:/home/node/app/build cgalvisleon/josephine:server
- docker run -d --rm --name server-demo -p 3000:3000 -v ./app:/home/node/app/build cgalvisleon/josephine:server

docker build -t react-server-express . &&
docker tag react-server-express cgalvisleon/react-server-express &&
docker tag react-server-express cgalvisleon/react-server-express:1.0.5 &&
docker push cgalvisleon/react-server-express &&
docker push cgalvisleon/react-server-express:1.0.5

- docker run -d --rm --name server-demo -p 3000:3000 cgalvisleon/josephine:react-server-express
- docker run -d --rm --name server-demo -p 3000:3000 -v $PDW/app:/home/node/app/build cgalvisleon/josephine:react-server-express
- docker run -d --rm --name server-demo -p 3000:3000 -v ./app:/home/node/app/build cgalvisleon/josephine:react-server-express

```

### Build Arm64

```
docker build -t react-server-arm -f ./Dockerfile .
docker build --platform linux/arm64 --no-cache -t react-server-arm -f ./Dockerfile .
docker tag react-server-arm cgalvisleon/react-server-arm
docker push cgalvisleon/react-server-arm
```
