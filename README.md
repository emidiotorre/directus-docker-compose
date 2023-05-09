# Self Host Directus on Docker Compose with SSL certificates provided by Let's Encrypt

### Use this boilerplate at your own risk, not intended for production use.

<br />

This is a boilerplate for self hosting [Directus](https://directus.io/) on [Docker Compose](https://docs.docker.com/compose/). It uses [Nginx](https://www.nginx.com/) as a reverse proxy and [Let's Encrypt](https://letsencrypt.org/) to provide SSL certificates.

It is based on the official [Directus Docker image](https://hub.docker.com/r/directus/directus) and the [Nginx Docker image](https://hub.docker.com/_/nginx).

The certbot configuration is taken from the [nginx-certbot repository](https://github.com/wmnnd/nginx-certbot) and the original article it's worth a read if you want to dive deeper: [Nginx and Let’s Encrypt with Docker in Less Than 5 Minutes](https://pentacent.medium.com/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71).

The script to validate the nginx configuration is taken from this [article](https://dev.to/simdrouin/validate-your-nginx-configuration-files-easily-with-docker-4ihi).

<br />

### Prerequisites

You need to have [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed on your machine.

<br />

### Getting Started

clone this repo and edit the `docker-compose.yml` and the `nginx/default.conf` files to your needs.

```bash
# provision certificates
chmox +x ./init-letsencrypt.sh
./init-letsencrypt.sh

# test nginx configuration
chmox +x ./test-nginx.sh
./test-nginx.sh

# start the containers
docker-compose up -d
```

### Contributing

Feel free to open an issue or submit a pull request.

Things I would like to add:

- [ ] Add a script to automate the initial configuration
- [ ] Add a script to select the directus extensions to install
- [ ] Support otherservices like [Laradock](https://github.com/laradock/laradock)
- [ ] Add Rsync scripts to easily move the files between different hosts

### Author

- Emidio Torre [@emid_io](https://twitter.com/emid_io)

### License

This project is open source and available under the [MIT License](LICENSE).

### Useful Commands

```bash
# start the containers
docker-compose up -d

# stop the containers
docker-compose down

# rebuild the containers
docker-compose up -d --build

# list containers
docker ps

# list all containers
docker ps -a

# list images
docker images

# list volumes
docker volume ls

# remove all containers
docker rm $(docker ps -a -q)

# remove all images
docker rmi $(docker images -q)

# remove all volumes
docker volume rm $(docker volume ls -q)

# remove all unused containers, volumes, networks and images
docker system prune
```
