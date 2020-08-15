# Josephine api
# version 1.0.0
FROM node:12-alpine

COPY ["package.json", "package-lock.json", "/usr/src/"]

WORKDIR /home/node/app

RUN npm install

COPY [".", "/home/node/app"]

EXPOSE 3000

# Production
CMD ["npm", "start"]
