# azk base docker image

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
