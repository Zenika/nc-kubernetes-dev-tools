#!/usr/bin/env sh

apt update
apt install -y docker.io

GITLAB_DOMAIN=$(curl "http://metadata.google.internal/computeMetadata/v1/instance/attributes/hostname" -H "Metadata-Flavor: Google")

docker container run --detach \
    --hostname ${GITLAB_DOMAIN} \
    --publish 443:443 --publish 80:80 --publish 2222:22 --publish 5050:5050 \
    --name gitlab \
    --restart always \
    --env GITLAB_OMNIBUS_CONFIG="external_url \"https://${GITLAB_DOMAIN}\"" \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest