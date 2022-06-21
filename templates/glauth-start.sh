#!/bin/bash
export HOME=/home/pacs/{{pac}}/users/{{user}}
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export PID=$HOME/var/run/glauth.pid
cd $HOME
exec $HOME/bin/glauth -c $HOME/etc/glauth.cfg >$HOME/var/log/glauth.log 2>&1 &
echo $! > $PID
