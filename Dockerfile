FROM node:24

RUN npm install -g json-server@0.17.4

WORKDIR /data
VOLUME /data

EXPOSE 8080

# Keep the executable as the ENTRYPOINT and put defaults in CMD so users can override/append args:
ENTRYPOINT ["json-server"]
CMD ["--watch", "db.json", "--port", "8080", "--host", "0.0.0.0"]
