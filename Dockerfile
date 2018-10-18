#Dockerize neputune cb syncing node js service
FROM node:8-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
RUN npm install
EXPOSE 8081
CMD [ "node", "syncService.js" ]
