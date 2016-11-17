# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER Jonas Medina <jonixmobile@gmail.com>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd vim epel-release.noarch; yum clean all

 

ADD ./ssh.sh /ssh.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN chmod 755 /ssh.sh
# EXPOSE 22
RUN ./ssh.sh

ENTRYPOINT ["/usr/sbin/sshd", "-D"]



