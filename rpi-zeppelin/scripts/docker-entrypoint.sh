#!/bin/bash

# Start Zeppelin as "zeppelin" user.
su - zeppelin -c "$ZEPPELIN_DIR/bin/zeppelin-daemon.sh start"

# Non-ending command to keep the container alive.
tail -F  /dev/null

