#!/bin/bash
# Tuning SSH
sed -i "s/exit 0/#exit 0/g" /etc/rc.local
echo "/usr/local/src/genkeys.sh
exit 0" >> /etc/rc.local

# Tuning Exim.
sed -i -e s/'begin acl'/'disable_ipv6 = true\nbegin acl'/g /etc/exim4/exim4.conf.template

# Tuning MySql
echo "[mysqld]
port = 3306
basedir = /usr
datadir = /var/lib/mysql
tmpdir = /tmp
language = /usr/share/mysql/english
pid-file = /var/run/mysqld/mysqld.pid
socket = /var/run/mysqld/mysqld.sock
user=mysql
symbolic-links=0
local-infile=0
#log_slow_queries = /var/log/mysql/mysql-slow.log
#long_query_time = 2
#log-queries-not-using-indexes
#ignore_builtin_innodb
innodb_file_per_table=1
default_storage_engine=MyISAM
skip-external-locking
query_cache_limit=1M
query_cache_size=32M
max_user_connections=200
max_connections=500
thread_cache_size=128
key_buffer_size=128M
join_buffer_size=1M
max_connect_errors=20
max_allowed_packet=8M
table_open_cache=256
sort_buffer_size=1M
read_buffer_size=1M
read_rnd_buffer_size=$1M
thread_concurrency=2
myisam_sort_buffer_size=64M
net_buffer_length = 8K
collation-server=utf8_unicode_ci
character_set_server=utf8
[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
open_files_limit=8192
socket = /var/run/mysqld/mysqld.sock
nice = 0
[mysqldump]
quick
quote-names
max_allowed_packet=16M
[mysql]
no-auto-rehash
[isamchk]
key_buffer=64M
sort_buffer=64M
read_buffer=16M
write_buffer=16M
[myisamchk]
key_buffer=64M
sort_buffer=64M
read_buffer=16M
write_buffer=16M
[mysqlhotcopy]
interactive-timeout
[client]
default-character-set=utf8
port = 3306
socket = /var/run/mysqld/mysqld.sock
!includedir /etc/mysql/conf.d/" > /etc/mysql/my.cnf
