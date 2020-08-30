# Josephine api
# version 1.0.0
FROM node:12-alpine
COPY ["package.json", "package-lock.json", "/usr/src/"]
WORKDIR /usr/src
RUN npm install
COPY [".", "/usr/src/"]
EXPOSE 3000
# Production
CMD ["npm", "start"]
