#!/bin/bash
mkdir -p /var/run/vsftpd/empty
useradd areggie -d /ftp -s /bin/bash -m -u 1234
echo -e "12345\n12345" | passwd areggie
groupadd ftgroup
usermod -G ftgroup areggie
chown -R areggie:ftgroup /ftp
chmod 777 /ftp
echo "areggie" | tee -a /etc/vsftpd.userlist
vsftpd