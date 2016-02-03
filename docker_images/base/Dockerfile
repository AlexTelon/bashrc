#Only things I really should always want when working with things
FROM ubuntu:15.10

RUN apt-get -y update \
        && apt-get -y install \
        sudo \
        wget \
        emacs24 \
        &&  apt-get clean \
        && rm -rf /var/lib/apt/lists/*

user root
RUN useradd -ms /bin/bash alex \
        && adduser alex sudo

USER alex
WORKDIR /home/alex

#fix emacs plugins
COPY ../../emacs_plugins ~/.emacs.d/plugins/
COPY ../../.emacs ~/

ENTRYPOINT
