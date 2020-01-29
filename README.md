# Hacker News Top 15 Stories

Este projeto é um _pet project_ e tem o objetivo de demonstrar capacidade de modelagem e a experimentação de novas tecnologias usando Ruby on Rails.

URL do projeto hospedado: https://hackernews-top-15-rails.herokuapp.com/

## Objetivo

Como um programador que gostaria de me manter atualizado, utilizo bastante o Hacker News (https://news.ycombinator.com), que é um portal onde é possível discutir histórias relevantes de tecnologia publicadas na internet.

O problema é que o portal Hacker News não é nada intuitivo, é complicado de encontrar coisas, e as discussões ficam muito perdidas.

Gostaria de construir um site, que lista as _top_ 15 histórias do Hacker News e mostra apenas os comentários relevantes dessas histórias. Além disso me permita buscar por alguma palavra chave.

![Template](https://raw.githubusercontent.com/eduardohertz/hackernews-top-15-rails/master/docs/site-template.png?token=AAA7V2GEJYLPU2Y2JYEHGW26D6R5Q)

#### Funcionalidades

1. Implementar o layout de acordo com a proposta. Pode ter adaptações, mas o mais próximo possível da sugestão
2. Mostrar em uma lista, ordenado pelo mais recente, as 15 top histórias do hacker news, de acordo com o layout.
3. Exibir apenas os comentários relevantes destas histórias. Comentários relevantes são aqueles que possuem mais de 20 palavras.
4. Permitir buscar por alguma palavra chave e mostrar os 10 resultados mais recentes. Não precisa considerar as top stories nesta busca.

#### Requisitos

* Usar a API do Hacker News: https://github.com/HackerNews/API

## Setup do projeto

#### Requerimentos

* Ruby >= 2.6.5
* RubyGems >= 3.0.6
* PostgreSQL >= 12.1
* NodeJS >= 12.14.1
* Redis >= 4.0.9
* Yarn >= 1.21.1

#### Passos

1) Baixe o projeto e instale as _gems_ e os pacotes npm usando `yarn`:

```bash
$ bundle install -j4 && yarn install
```

2) Copie o arquivo .env e edite de acordo com as suas configurações locais:

```bash
$ cp .env.example .env
```

3) Faça o _setup_ do banco de dados:

```bash
$ rails db:setup
```

4) Execute o arquivo `Procfile.development` com o `foreman`:

```bash
$ bundle exec foreman -f Procfile.development
```

## Deploy

1) Adicione o `git remote` do Heroku:

```
$ heroku git:remote -a hackernews-top-15-rails -r heroku
```

2) Realize _deploy_:

```
$ git push heroku master
```

## Suíte de teste

Após realizar o _setup_ da aplicação, basta executar:

```
$ bundle exec rspec spec/
```

## TODO
- [ ] Criar uma camada de _cache_ temporário para evitar requisições desnecessárias à API. Este _cache_ pode ser feito usando Redis ou PostgreSQL
- [ ] Refatorar views componetizando elementos em comum
- [ ] Refatorar busca de comentários para usar o ActionCable
- [ ] Refatorar CSS para utilizar BEM
- [ ] Configurar corretamente o output dos logs para o formato `key=value`
