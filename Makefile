
IMAGE_REPOSITORY:=azukiapp/azktcl
IMAGE_TAG:=0.0.1
IMAGE:=${IMAGE_REPOSITORY}:${IMAGE_TAG}

main: build

rootfs.tar: rootfs
	docker build -t ${IMAGE_REPOSITORY}_rootfs rootfs
	docker run --rm ${IMAGE_REPOSITORY}_rootfs > rootfs.tar

build: rootfs.tar
	docker build -t ${IMAGE} .

test:
	docker run -t -i -p 80:80/tcp -p 53:53/udp ${IMAGE}

.PHONY: rootfs.tar build main test
