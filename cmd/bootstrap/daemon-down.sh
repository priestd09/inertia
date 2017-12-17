# Basic script for bringing down the daemon.

set -e

DAEMON_NAME=inertia-daemon

# Check if already running.
ALREADY_RUNNING=`sudo docker ps -q --filter "name=$DAEMON_NAME"`

# Take existing down.
sudo docker rm -f $ALREADY_RUNNING
