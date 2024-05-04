FROM node:22

RUN npm install -g json-server@0.17.4

WORKDIR /data
VOLUME /data

EXPOSE 8080
ENTRYPOINT ["json-server", "-p", "8080", "--host", "0.0.0.0", "--watch", "db.json"]
