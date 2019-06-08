# README

## Quick Start on Docker
```bash
$ docker-compose build
$ docker-compose run --rm web rake db:create
$ docker-compose run --rm web bundle exec rails db:migrate
$ docker-compose run --rm web rails db:seed
$ docker-compose up
```
