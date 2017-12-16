#!/bin/sh

# Produces a public-private key-pair and outputs the public key.

set -e

ID_DESTINATION=$HOME/.ssh/id_rsa_inertia_deploy
PUB_ID_DESTINATION=$HOME/.ssh/id_rsa_inertia_deploy.pub

# Check if destination file already exists:
if [ -f $ID_DESTINATION ]; then
    echo "key-gen sequence already run"
    if [ -f $PUB_ID_DESTINATION ]; then
        # Nothing to do....
        echo "public key found"
    else
        echo "public key does not exist, recreating public key from private"
        ssh-keygen -y -f $ID_DESTINATION > $PUB_ID_DESTINATION
    fi;
else
    # Generate key with no password.
    ssh-keygen -f $ID_DESTINATION -t rsa -N ''
fi


cat $PUB_ID_DESTINATION