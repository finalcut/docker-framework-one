FROM ubuntu:latest
MAINTAINER finalcut bill@rawlinson.us

ENV REFRESHED_AT 2014_08_19_1

ADD https://github.com/framework-one/fw1/archive/v2.5.tar.gz /tmp/fw1.zip
ADD https://github.com/framework-one/aop1/archive/0.1.tar.gz /tmp/apo1.zip
ADD https://github.com/framework-one/di1/archive/v0.5.tar.gz /tmp/di1.zip

WORKDIR /tmp
RUN tar -xzf fw1.tar.gz
RUN mv fw1-2.5 fw1/fw1
RUN rm fw1.tar.gz

RUN tar -xzf aop1.tar.gz
RUN mv aop1-0.1 fw1/aop1
RUN rm aop1.tar.gz

RUN tar -xzf di1.tar.gz
RUN mv di1-0.5 fw1/di1
RUN rm di1.tar.gz

VOLUME /tmp/fw1

CMD ["/bin/sh"]
