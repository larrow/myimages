#
# Dockerfile for ShadowVPN
#

FROM alpine

RUN apk add -U autoconf \
               automake \
               build-base \
               gawk \
               git \
               iptables \
               libtool \
               linux-headers \
    && git clone --recursive https://github.com/vimagick/ShadowVPN.git \
    && cd ShadowVPN \
    && ./autogen.sh \
    && ./configure --enable-static --sysconfdir=/etc \
    && make install \
    && cd .. \
    && rm -rf ShadowVPN \
    && apk del autoconf \
               automake \
               build-base \
               gawk \
               git \
               libtool \
               linux-headers

COPY entrypoint.sh /entrypoint.sh
EXPOSE 1123/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["sh"]

