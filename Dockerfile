FROM centos:7
MAINTAINER Hao Luo, luohao.brian@gmail.com
LABEL name="cGit P5 Image" \
    vendor="Fensitech" \
    license="GPLv2" \
    build-date="2016-05-19"

# Install all prerequisite RPM packages
RUN rm -rf /etc/yum.repos.d/* && \
    curl -o /etc/yum.repos.d/base.repo http://www.wiaapp.cn/downloads/yum/centos/7/CentOS7-Base-163.repo && \
    curl -o /etc/yum.repos.d/epel.repo http://www.wiaapp.cn/downloads/yum/centos/7/epel.repo && \
    yum -y update && \
    yum install -y cgit git gettext&& \
    yum clean all

RUN mkdir /srv/git
VOLUME ["/srv/git"]

COPY cgitrc.template /etc/
COPY syntax-highlighting.sh /usr/libexec/cgit/filters

ADD dumb-init_1.0.0_amd64 /sbin/dumb-init
RUN chmod +x /sbin/dumb-init

COPY startup.sh /sbin

ENV CGIT_TITLE "cGit Interface"
ENV CGIT_DESC "Super fast interface to git repositories"
ENV CGIT_VROOT "/"
ENV CGIT_SECTION_FROM_STARTPATH 0

EXPOSE 80

CMD ["/sbin/dumb-init", "/sbin/startup.sh"]
