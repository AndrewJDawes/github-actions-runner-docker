#!/usr/bin/env bash
if [ -f "getenv.sh" ]; then
    source getenv.sh
fi

# Please note that this container has access to the host's docker daemon
# https://itnext.io/docker-in-docker-521958d34efd

eval_cmd="docker run \
-d \
--restart=unless-stopped \
--name $PROJECT_DOCKER_CONTAINER_NAME \
--env ORGANIZATION=$PROJECT_GITHUB_ORGANIZATION \
--env ACCESS_TOKEN=$PROJECT_GITHUB_ACCESS_TOKEN \
-v /var/run/docker.sock:/var/run/docker.sock \
$PROJECT_DOCKER_FULL_PATH
"
eval "$eval_cmd"
