FROM alpine
MAINTAINER Randy Stauner <randy@magnificent-tears.com>

ENV PLENV_ROOT /opt/plenv
ENV PATH $PLENV_ROOT/bin:$PLENV_ROOT/shims:$PATH

RUN apk --update add \
    ca-certificates \
    git \
# git push
    openssh-client \
# plenv
    bash \
    perl \
    patch \
# plenv, cpanm
    curl \
# compiling perl (and common modules)
    build-base \
    linux-headers \
    ncurses-dev \
    readline-dev \
    libressl libressl-dev \
    zlib-dev \
    expat-dev \
    xmlsec-dev \
# perl build looks for
    procps \
  && git clone git://github.com/tokuhirom/plenv.git $PLENV_ROOT \
  && git clone git://github.com/tokuhirom/Perl-Build.git $PLENV_ROOT/plugins/perl-build \
  && curl -sL https://cpanmin.us > /usr/local/bin/cpanm \
    && chmod 0755 /usr/local/bin/cpanm \
  && rm -rf /var/cache/apk/*

VOLUME $PLENV_ROOT

# Avoid "Cannot determine local time zone" with DateTime time_zone => "local".
ENV TZ UTC

# Use the curl we installed rather than the busybox wget.
ENV PERL_CPANM_OPT --no-wget
# for cpanm --look
ENV SHELL /bin/bash

CMD ["/bin/bash"]
