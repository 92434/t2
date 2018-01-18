FROM ubuntu:14.04
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/pooler/cpuminer.git
RUN apt-get update && apt-get install -y \
	automake \
	libcurl4-openssl-dev \
	make
RUN cd cpuminer && \
	./autogen.sh && \
	./configure CFLAGS="-O3" && \
	make && \
	make install
ENTRYPOINT	["minerd"]
