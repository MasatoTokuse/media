# README

## 使用技術
- Ruby:2.5.1
- Rails:5.2.3
- MySQL:8.0.15
- bootstrap:4.3.1
- will_paginate:3.1.6
- carrierwave:1.0
- Docker
- CircleCI
- AWS
 - EC2
 - ELB
 - Route53(ドメインの登録)
 - Certificate Manager(証明書の発行)

## CI/CD
`git push`するとCircleCIでビルドおよびテストします。
テストにパスするとAWSのEC2インスタンスにデプロイします。

## URL
https://www.mst-tokuse-portfolio.com/

## アプリ概要
WEB記事投稿サイトです。記事の投稿や閲覧ができます。
機能確認用にサンプルアカウントを作成しております。
ログイン画面にて初期入力されておりますので、ぜひご利用ください。

## アプリ機能
- ユーザー登録機能
- ログイン機能
- 記事一覧機能
- 記事投稿機能(画像も可)
- 記事編集機能
- 記事削除機能

## Quick Start on Docker
```bash
$ docker-compose build
$ docker-compose run --rm web rails db:create
$ docker-compose run --rm web rails db:migrate
$ docker-compose run --rm web rails db:seed
$ docker-compose up
```