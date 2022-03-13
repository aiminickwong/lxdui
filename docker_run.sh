#!/bin/bash
docker run -it -d --name lxdui \
--restart=always -p 15151:15151 \
-v /var/snap/lxd/common/lxd/unix.socket:/var/snap/lxd/common/lxd/unix.socket \
armv8a/lxdui

docker exec -it lxdui /bin/bash
