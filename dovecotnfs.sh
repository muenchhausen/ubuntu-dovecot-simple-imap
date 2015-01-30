#!/bin/bash
set -e

if [ "${NFS_REMOTETARGET}" != "" ]
	then
		rpcbind
		mount -t nfs -o nolock ${NFS_REMOTETARGET} /home/mailarchive/Maildir
fi

eval /usr/sbin/dovecot ${@}
