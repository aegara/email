#!/bin/bash

syslog-ng

postconf myhostname=$(hostname -f)
postconf mydestination=$(hostname -d)
newaliases

postfix start

adduser $USER_NAME
echo $USER_PASSWORD | passwd $USER_NAME --stdin
chmod 600 /var/mail/$USER_NAME

echo -e '\n# Custom\nmail_location=mbox:~/mail:INBOX=/var/mail/%u' \
    >> /etc/dovecot/conf.d/10-mail.conf

dovecot
