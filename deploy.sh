#!/usr/bin/env bash

assetdir="/opt/gitlab/embedded/service/gitlab-rails/public/assets"
tags=$(cat tags.txt)

for tag in $tags; do
    a=$(docker pull gitlab/gitlab-ce:$tag)
    filename=$(docker run --rm -it --entrypoint "" gitlab/gitlab-ce:$tag ls $assetdir|egrep '^application-.*\.css' | grep -v \.gz)
    echo $tag,$filename >> fileVer.txt
    b=$(docker rmi gitlab/gitlab-ce:$tag)

done

