#!/bin/sh
echo -e "$FTP_PASSWORD\n$FTP_PASSWORD" | passwd ftpuser
vsftpd