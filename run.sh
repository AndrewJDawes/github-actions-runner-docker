#!/usr/bin/env bash
if [ -f "getenv.sh" ]; then
    source getenv.sh
fi

eval_cmd="docker run \
-d \
--restart=unless-stopped \
--name $PROJECT_DOCKER_CONTAINER_NAME \
--env ORGANIZATION=$PROJECT_GITHUB_ORGANIZATION \
--env ACCESS_TOKEN=$PROJECT_GITHUB_ACCESS_TOKEN \
$PROJECT_DOCKER_FULL_PATH
"
eval "$eval_cmd"
