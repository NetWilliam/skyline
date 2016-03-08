#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
BASE_DIR=`dirname $DIR`
TMP_DIR="$BASE_DIR/tmp/"
CONF_DIR="$BASE_DIR/conf/"
MONITOR_PATH="$CONF_DIR/monitor.conf"
WARNING_PATH="$CONF_DIR/warning.conf"
CLIENT_PATH="$CONF_DIR/client.ini"
GATHER_PATH="$CONF_DIR/gather.ini"
FILTER_PATH="$CONF_DIR/filter.ini"
SERVER_PATH="$CONF_DIR/server.ini"
CUR_PID=$$



function check_param
{
    if [ $# -lt 1 ]; then
		echo "usage:"
		echo "        controller.sh start|stop|restart client|server"
		echo "        controller.sh verify"
        exit 1
    fi
    if [ "x$1" != "xverify" ]; then
        if [ "x$2" != "xclient" ] && [ "x$2" != "xserver" ]; then
            echo "usage:"
            echo "        controller.sh start|stop|restart client|server"
            echo "        controller.sh verify monitor_path warning_path"
            exit 1
        fi
    fi
}

function func_routine
{
    option=$1
    case $option in
        start)
            supervisor_sock_set $*
            supervisor_conf_set $*
            _start $*
            ;;
        stop)
            supervisor_conf_set $*
            _stop $*
            ;;
        restart)
            supervisor_conf_set $*
            _restart $*
            ;;
        verify)
            _verify $*
            ;;
        *)
            echo "usage:"
            echo "        controller.sh start|stop|restart client|server"
            echo "        controller.sh verify monitor_path warning_path"
            exit 1
            ;;
    esac
}

function supervisor_sock_set
{
    echo "setting supervisor configure"
    sock_url=$TMP_DIR$CUR_PID.sock
    cur_md5=`echo $BASE_DIR | md5sum | cut -d' ' -f 1`
    echo "curmd5: $cur_md5"
    if [ -f "/tmp/$cur_md5" ]; then
        return 0
    fi
    sed -i.old 's#^file=.*$#file='$sock_url'#g' $CONF_DIR/*.ini
    sed -i.old 's#^serverurl=.*$#serverurl=unix://'$sock_url'#g' $CONF_DIR/*.ini

    sed -i.old 's#^command=.*$#command=python '$BASE_DIR'/skyline-client/gather.py '$CONF_DIR/monitor.conf'#g' $GATHER_PATH
    sed -i.old 's#^command=.*$#command=python '$BASE_DIR'/skyline-client/filter.py '$CONF_DIR/monitor.conf' '$CONF_DIR/warning.conf'#g' $FILTER_PATH
    sed -i.old 's#^command=.*$#command=python '$BASE_DIR'/skyline/runserver.py 9999#g' $SERVER_PATH
    touch /tmp/$cur_md5
}

function supervisor_conf_set
{
    :
}

function supervisor_conf_reload
{
    :
}

function _start
{
    echo "starting"
    module=$2
    supervisord -c $BASE_DIR/conf/supervisor.ini
    if [ "x$module" == "xclient" ]; then
        supervisorctl -c $BASE_DIR/conf/supervisor.ini start gather
        supervisorctl -c $BASE_DIR/conf/supervisor.ini start filter
    else
        supervisorctl -c $BASE_DIR/conf/supervisor.ini start runserver
    fi
}

function _stop
{
    echo "stopping"
    module=$2
    if [ "x$module" == "xclient" ]; then
        supervisorctl -c $BASE_DIR/conf/supervisor.ini stop gather
        supervisorctl -c $BASE_DIR/conf/supervisor.ini stop filter
    else
        supervisorctl -c $BASE_DIR/conf/supervisor.ini stop runserver
    fi
}

function _restart
{
    echo "restarting"
    module=$2
    if [ "x$module" == "xclient" ]; then
        supervisorctl -c $BASE_DIR/conf/supervisor.ini restart gather
        supervisorctl -c $BASE_DIR/conf/supervisor.ini restart filter
    else
        supervisorctl -c $BASE_DIR/conf/supervisor.ini restart runserver
    fi
}

function _verify
{
    echo "verifying"
    python $BASE_DIR/skyline-client/skyline_ctrl.py verify $MONITOR_PATH $WARNING_PATH
}


check_param $*
func_routine $*


#echo "DIR:$DIR"
#echo "PARENT_DIR:$BASE_DIR"
#echo "TMP_DIR:$TMP_DIR"
#echo "CUR_PID:$CUR_PID"
