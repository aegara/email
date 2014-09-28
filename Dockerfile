FROM fedora:20

RUN yum -y update

RUN yum -y install syslog-ng; \
    sed -i 's/.*\/proc\/kmsg.*/#&/g' /etc/syslog-ng/syslog-ng.conf

RUN yum -y install postfix; \
    postconf inet_interfaces=all

RUN yum -y install dovecot

ADD src/setup.sh /

CMD ["/setup.sh"]
