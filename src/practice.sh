#!/bin/bash

echo "all variables : $@"
echo "number of variables passed : $#"
echo "script name - $0"
echo "current working directory : $PWD"
echo "home directory of current user - $HOME"
echo "host name: $HOSTNAME"
echo "process id of the current shwll script - $$"
sleep 60 &
echo "process id of the last background comand - $!"