#!/bin/sh
USER=user

# Verify if the permissions have been set as environment variables
if [ -z "$PUID" ]; then
	PUID=$(id -u $USER)
	echo WARNING: You might want to set the PUID environment variable if you have problems creating/saving notebooks.
fi
if [ -z "$PGID" ]; then
	PGID=$(id -g $USER)
	echo WARNING: You might want to set the PGID environment variable if you have problems creating/saving notebooks.
fi
if [ -z "$UMAS" ]; then
	UMAS=$(umask)
	echo WARNING: You might want to set the UMAS environment variable if you have problems creating/saving notebooks.
fi

# Set the correct permissions for user $USER
usermod -u $PUID -g $PGID $USER
umask $UMAS

# Run the application as user $USER
trap "echo INFO: Graceful shutdown successful." TERM
su -c /app/run.sh $USER & wait