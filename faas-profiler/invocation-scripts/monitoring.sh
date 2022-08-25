FAAS_ROOT="/home/matheo/ets-project/projet-ets/faas-profiler"
time_stamp=$(date +%s%N | cut -b1-13)
systemd-cgtop > $FAAS_ROOT'/logs/systemd-cgtop_'$time_stamp'.txt'