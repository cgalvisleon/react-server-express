FROM node:12.21.0-alpine
COPY ["package.json", "package-lock.json", "/usr/src/"]
WORKDIR /usr/src
RUN npm install
COPY [".", "/usr/src/"]
EXPOSE 3000
CMD ["npm", "start"]
