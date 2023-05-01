#!/bin/sh

command="jupyter notebook -y --allow-root --no-browser --ip=0.0.0.0"

if [ "$JUPYTER_NO_PASS" = "TRUE" ]; then
    $command --NotebookApp.token='' --NotebookApp.password=''
else
    $command
fi