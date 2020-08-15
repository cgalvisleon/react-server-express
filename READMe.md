### react-server-express

Is an express server from deploy react.js in server node.js

### Docker

```

- docker build -t server .
- docker tag server cgalvisleon/josephine:server
- docker push cgalvisleon/josephine:server
- docker run -d --rm --name app-demo -p 3000:3000 cgalvisleon/josephine:server
- docker run -d --rm --name app-demo -p 3000:3000 -v $PDW/app/buld:/home/node/app/build cgalvisleon/josephine:server
```
