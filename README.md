# README

## 使用技術
- Ruby:2.5.1
- Rails:5.2.3
- MySQL:8.0.15
- bootstrap:4.3.1
- will_paginate
- carrierwave
- Docker
- CircleCI
- GCP

## Quick Start on Docker
```bash
$ docker-compose build
$ docker-compose run --rm web rails db:create
$ docker-compose run --rm web rails db:migrate
$ docker-compose run --rm web rails db:seed
$ docker-compose up
```
