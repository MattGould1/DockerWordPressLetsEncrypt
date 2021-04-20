# Docker WordPress Boilerplate

Basic WordPress site running with mysql 8 on Docker. Comes with commands to setup offline and online development including SSL certificates

## Get started

- Install docker
- Install docker-compose
- Start docker daemon (if it isn't running)
- Update and copy .env.sample to .env (replace values)
- `docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build` to create containers
- For all scripts make sure they are executable by using `chmod +x scripts`
- Visit `http://localhost` and install your wordpress site.

### Create a DB dump

`./scripts/backup.sh`

Commit your database into your GIT repo to maintain an offline/online state.

### Load a DB dump

`./scripts/restore.sh`

### Committing WP, Theme, Plugin and Database changes.

If you have installed a new theme, plugin etc for this to be included in your production website your database has to reflect the changes. Prior to committing run `./scripts/backup.sh` and commit `./database/` into GIT.

### Local Dockers

Our local docker configuration differs to production, we don't have SSL and we also don't need certbot to run.

`docker-compose -f docker-compose.yml -f docker-compose.dev.yml up`

### Deploying to server (production)

`docker-compose -f dokcer-compose.yml -f docker-compose.prod.yml up`

This command automatically runs certbot and generates certificates for your domain.

If you have not, you will also need to edit your crontab to run `ssl_renew.sh` every (12 up to you) hours.
