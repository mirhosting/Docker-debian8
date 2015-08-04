#!/bin/bash
if test ! -e /etc/ssh/lock_gen_keys ; then
rm -f /etc/ssh/ssh_host_*
ssh-keygen -A
touch /etc/ssh/lock_gen_keys
fi
