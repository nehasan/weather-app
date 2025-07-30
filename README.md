# Weather App

## Project Structure

Built with Ruby on Rails API only

- Ruby version: 3.2.2
- Rails version: 7.2.1
- Database: PostgreSQL 15

## How to configure the project

- Open terminal and paste `git clone https://github.com/nehasan/weather-app.git`
- Change current dir to the project dir `cd weather-app`
- Run the following commands to create `master.key` under `./weather-api/config`

```
> cd weather-api
> find . -name master.key // certainly fails to find the master.key file
> EDITOR=vi bin/rails credentials:edit
```

## How to run

- Run the following commands to build containers and make your services running

```
> cd
> cd weather-app
> docker compose down
> docker compose up -d
```

## Open the UI

- Once the Next.js server is up and running visit http://localhost:3001/weathers/search

### Some useful commands to maintain local bundle (Ignore)

```
> bundle config set --local path $PWD/.bundle
> bundle config unset path
```
