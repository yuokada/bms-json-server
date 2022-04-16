FROM node:17

RUN npm install -g json-server@0.17.0

WORKDIR /data
VOLUME /data

EXPOSE 8080
ENTRYPOINT ["json-server", "-p", "8080", "--host", "0.0.0.0", "--watch", "db.json"]
