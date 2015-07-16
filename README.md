apache24-rust-module-example-docker
===================================

A Dockerfile for building an example Apache 2.4 module written in rust.
The library and example code is at [majorz/apache2-rs](https://github.com/majorz/apache2-rs).

## Usage

build and run apache.

```
git clone https://github.com/hnakamur/apache24-rust-module-example-docker
sudo docker build -t apache24_rs apache24-rust-module-example-docker
sudo docker run -d -p 80:80 --name apache24_rs -t apache24_rs
```

send a http request

```
# curl http://localhost/hello
Hello Ciao Здравейте
```

## License
MIT
