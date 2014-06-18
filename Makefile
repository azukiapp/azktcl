
IMAGE_REPOSITORY:=azukiapp/azktcl
IMAGE_TAG:=0.0.1
IMAGE:=${IMAGE_REPOSITORY}:${IMAGE_TAG}
DOCKER:="docker"

main: build

clean:
	${DOCKER} rmi ${IMAGE_REPOSITORY}_rootfs ${IMAGE_REPOSITORY}

rootfs.tar: rootfs
	${DOCKER} build -t ${IMAGE_REPOSITORY}_rootfs rootfs
	${DOCKER} run --rm ${IMAGE_REPOSITORY}_rootfs > rootfs.tar

build: rootfs.tar
	${DOCKER} build -t ${IMAGE} .

test:
	${DOCKER} run --rm -t -i -p 80:80/tcp -p 53:53/udp ${IMAGE}

.PHONY: rootfs.tar build main test clean
