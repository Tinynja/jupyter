#!/bin/sh
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

command="jupyter lab --config="$SCRIPTPATH/jupyter_lab_config.py""

if [ "$JUPYTER_NO_PASS" = "TRUE" ]; then
    $command --ServerApp.token=''
else
    $command
fi