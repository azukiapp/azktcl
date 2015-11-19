# azk base docker image

[![This project was superseded by https://github.com/azukiapp/docker-internal-services](http://messages.hellobits.com/warning.svg?message=This%20project%20was%20superseded%20by%20https%3A%2F%2Fgithub.com%2Fazukiapp%2Fdocker-internal-services)](https://github.com/azukiapp/docker-internal-services)

Base Docker image used in `azk` to run:

- azk spect tests;
- dns server;
- socat tcp port redirect;

## Build

```bash
$ make
```

or

```bash
$ docker build -t azukiapp/azkbase_rootfs rootfs
$ docker run --rm azukiapp/azkbase_rootfs > rootfs.tar
$ docker build -t azukiapp/azkbase .
```

## License

"Azuki", "azk" and the Azuki logo are copyright (c) 2013-2015 Azuki Serviços de Internet LTDA.

azk source code is released under Apache 2 License.

Check LEGAL and LICENSE files for more information.
