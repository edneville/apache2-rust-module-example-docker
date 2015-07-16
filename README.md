apache24-rust-module-example-docker
===================================

A Dockerfile for building an example Apache 2.2 or 2.4 module written in rust.

## Build steps for Apache 2.4
The library and example code is at [majorz/apache2-rs](https://github.com/majorz/apache2-rs).

build and run apache.

```
git clone https://github.com/hnakamur/apache2-rust-module-example-docker
sudo docker build -t apache24_rs apache2-rust-module-example-docker
sudo docker run -d -p 80:80 --name apache24_rs -t apache24_rs
```

send a http request

```
# curl http://localhost/hello
Hello Ciao Здравейте
```

## Build steps for Apache 2.2
The library and example code is at [hnakamur/apache2-rs support_apache2.2 branch](https://github.com/hnakamur/apache2-rs/tree/support_apache2.2).

build and run apache.

```
git clone https://github.com/hnakamur/apache2-rust-module-example-docker
cd apache2-rust-module-example-docker
git checkout support_apache2.2
sudo docker build -t apache22_rs .
sudo docker run -d -p 80:80 --name apache22_rs -t apache22_rs
```

send a http request

```
# curl http://localhost/hello
Hello Ciao Здравейте
```

## License
MIT
