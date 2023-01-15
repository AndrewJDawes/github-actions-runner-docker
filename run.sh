#!/usr/bin/env bash
if [ -f "getenv.sh" ]; then
    source getenv.sh
fi

# Please note that this container has access to the host's docker daemon
# https://itnext.io/docker-in-docker-521958d34efd

# Get the group that owns the docker daemon socket and add this group to container's user
# https://forums.docker.com/t/docker-in-docker-for-non-root-user/70150
DOCKER_SOCKET=/var/run/docker.sock

if [ -S ${DOCKER_SOCKET} ]; then
    DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
fi

eval_cmd="docker run \
-d \
--group-add ${DOCKER_GID} \
--restart=unless-stopped \
--name $PROJECT_DOCKER_CONTAINER_NAME \
--env ORGANIZATION=$PROJECT_GITHUB_ORGANIZATION \
--env ACCESS_TOKEN=$PROJECT_GITHUB_ACCESS_TOKEN \
-v /var/run/docker.sock:/var/run/docker.sock \
$PROJECT_DOCKER_FULL_PATH
"
eval "$eval_cmd"
