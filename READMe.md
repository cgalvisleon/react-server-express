### react-server-express

Is an express server from deploy react.js in server node.js

### Docker Hub

```

- docker build -t server .
- docker tag server cgalvisleon/josephine:server
- docker push cgalvisleon/josephine:server
- docker run -d --rm --name server-demo -p 3000:3000 cgalvisleon/josephine:server
- docker run -d --rm --name server-demo -p 3000:3000 -v $PDW/app:/home/node/app/build cgalvisleon/josephine:server
- docker run -d --rm --name server-demo -p 3000:3000 -v ./app:/home/node/app/build cgalvisleon/josephine:server
```
