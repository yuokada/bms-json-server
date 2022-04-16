# bms-json-server

- [My JSON Server - Fake online REST server for teams](https://my-json-server.typicode.com/)
- [My JSON Server - yuokada/bms-json-server](https://my-json-server.typicode.com/yuokada/bms-json-server)

## How to build and run a json-server container

```shell
$ docker build -t json-server .
$ docker run -t  -v `pwd`:/data -p 8080:8080 json-server

  \{^_^}/ hi!

  Loading db.json
  Done

  Resources
  http://0.0.0.0:8080/teams
  http://0.0.0.0:8080/games
  http://0.0.0.0:8080/players

  Home
  http://0.0.0.0:8080

  Type s + enter at any time to create a snapshot of the database
GET /db 304 19.945 ms - -
```

## How to kill a json-server container

```shell
$ docker kill $(docker ps --latest -q)
```

## Limits

> To be able to provide a free service to as many people as possible during this phase, the project comes with a few limits:
>
> - Changes are faked and aren't persisted (just like JSONPlaceholder)
> - Requests are cached (1 minute)
> - db.json has limits
> - All servers are public
> - Private GitHub repositories aren't supported (yet)

see: https://my-json-server.typicode.com/


> -    10KB db.json max
> -    5 max REST endpoints
> -    30 max items per endpoint

see: https://my-json-server.typicode.com/pricing


## Issues

- [--watch is not reloading when host file changes · Issue #8 · clue/docker-json-server](https://github.com/clue/docker-json-server/issues/8)
