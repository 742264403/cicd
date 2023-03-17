ARG version=7
FROM centos:${version}
MAINTAINER HWJ
RUN mkdir /hwjvol
VOLUME ["vdata1","hwjvol"]
LABEL version="12" author=hwj description="This is hwj's nginx"
RUN yum install -y wget 
RUN wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
RUN yum install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD index.html /usr/share/nginx/html/index.html
EXPOSE 80 443 
CMD ["/usr/sbin/nginx"]
