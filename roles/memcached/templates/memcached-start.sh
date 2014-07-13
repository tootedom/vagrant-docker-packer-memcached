#! /bin/sh

# Source function library.
. /etc/rc.d/init.d/functions

PORT=11211
USER=nobody
MAXCONN=1024
CACHESIZE=64
OPTIONS=""
INTERFACE="0.0.0.0"

if [ -f /etc/sysconfig/memcached ];then
    . /etc/sysconfig/memcached
fi


exec memcached -l $INTERFACE -p $PORT -u $USER  -m $CACHESIZE -c $MAXCONN -P /var/run/memcached/memcached.pid $OPTIONS