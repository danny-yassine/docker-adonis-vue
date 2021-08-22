# docker-adonis-vue

Simple skeleton in order to quickly start a new project with the following technologies:

* adonis.js (swoole)
* vue
* mysql/mariadb

<br>
<br>

<table>
  <tr>
    <td valign="top">
<div style="width: 75px; height: 75px;">
        <img width="75" height="75" src="https://adonisjs.com/icons/apple-touch-icon.png">
    </div>
</td>
    <td valign="top">
<div style="width: 150px; height: 75px;">
        <img width="150" height="75" src="https://vuejs.org/images/logo.svg">
    </div>
    <td valign="top">
<div style="width: 150px; height: 75px;">
        <img width="150" height="75" src="https://mariadb.org/wp-content/themes/twentynineteen-child/icons/mariadb_org_rgb_h.svg">
    </div>
</td>
  </tr>
</table>

## Structure

Each technology is containerized for easy development

    * Backend: Adonis.js
    * Frontend: vue client
    * Data: database (mysql or mariadb)

## Auto refresh

While the containers are running, the backend and frontend will auto refresh when making changes to the application code. No need to rebuild the containers.

## Getting Started

##### Build the containers

```bash
make build
```

##### Start developing

```bash
make dev
```

##### While the containers are running, migrate the database

```bash
make migrate
```

## Deploying to heroku

ref: https://www.youtube.com/watch?v=4axmcEZTE7M

* Create (if not there) a `heroku.yml` file at the root of the project with:
```shell
build:
  docker:
    web: adonis.deploy.dockerfile
```
* Create a pipeline on heroku.
* Modify the stack to `container` for the pipeline:
```bash
heroku stack:set container --app <app-name>
```
* Create a staging application
* Add a config var for `APP_KEY`
* Deploy with branch

#### Under a paid plan

* for zero downtime, set [preboot](https://devcenter.heroku.com/articles/preboot):
```bash
heroku features:enable preboot -a <app>
```