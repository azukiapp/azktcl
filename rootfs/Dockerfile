FROM debian:jessie
MAINTAINER Everton Ribeiro <nuxlli@gmail.com>

RUN apt-get update && apt-get -y install  unzip \
                        curl \
                        squashfs-tools \
                        cpio


ENV ROOTFS        /rootfs
ENV TCL_REPO_BASE http://tinycorelinux.net/5.x/x86

# Make the ROOTFS
RUN mkdir -p $ROOTFS

# Download the rootfs, don't unpack it though:
RUN curl -L -o /tcl_rootfs.gz $TCL_REPO_BASE/release/distribution_files/rootfs.gz

ENV TCZ_DEPS ncurses bash \
             socat dnsmasq

# Install the TCZ dependencies
RUN for dep in $TCZ_DEPS; do \
        echo "Download $TCL_REPO_BASE/tcz/$dep.tcz" &&\
        curl -L -o /tmp/$dep.tcz $TCL_REPO_BASE/tcz/$dep.tcz && \
        unsquashfs -f -d $ROOTFS /tmp/$dep.tcz && \
        rm -f /tmp/$dep.tcz ;\
    done

# Download Tiny Core Linux rootfs
RUN cd $ROOTFS/usr/local && zcat /tcl_rootfs.gz | cpio -f -i -H newc -d --no-absolute-filenames

# Tar
RUN cd $ROOTFS/usr/local && tar -cf /rootfs.tar ./

CMD ["cat", "/rootfs.tar"]
