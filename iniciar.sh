#!/bin/bash
ulimit -c unlimited
while true; do 
echo "Restart : `date +%d-%m-%Y--%H:%M`" >> ./restart.log
./theotxserver --log-file "output.txt" "error.txt";
 done


