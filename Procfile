gather: ./forever python skyline-client/gather.py conf/monitor.conf
filter: ./forever python skyline-client/filter.py conf/monitor.conf conf/warning.conf
server: ./forever python skyline/runserver.py $SERVER_PORT
