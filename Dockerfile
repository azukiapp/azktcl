FROM       scratch
MAINTAINER Everton Ribeiro <nuxlli@gmail.com>

ADD ./rootfs.tar /

CMD ["/bin/bash"]
