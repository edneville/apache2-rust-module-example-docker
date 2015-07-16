FROM ubuntu:precise
MAINTAINER Hiroaki Nakamura <hnakamur@gmail.com>

RUN apt-get update -y \
 && apt-get install -y clang make curl git sudo \
                       apache2-mpm-prefork apache2-prefork-dev \
 && mkdir -p /var/lock/apache2 /var/run/apache2

RUN curl -sSfO https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh \
 && SHELL=/bin/bash /bin/bash blastoff.sh --yes \
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN cd /root \
 && git clone https://github.com/hnakamur/apache2-rs \
 && cd apache2-rs/examples/mod_hello \
 && git checkout support_apache2.2 \
 && cargo build --release \
 && cp target/release/libmod_hello.so /usr/lib/apache2/modules/mod_hello.so \
 && echo 'LoadModule hello_module /usr/lib/apache2/modules/mod_hello.so' > /etc/apache2/mods-available/hello.load \
 && a2enmod hello

ADD apache/ /etc/apache/

EXPOSE 80
CMD ["/bin/bash", "-c", "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"]
