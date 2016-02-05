## -*- docker-image-name: "base" -*-
#Only things I really should always want when working with things
FROM ubuntu:15.10

RUN apt-get -y update \
        && apt-get -y install \
        sudo \
	git \
        wget \
        emacs24 \
	make \
        &&  apt-get clean \
        && rm -rf /var/lib/apt/lists/*

user root
RUN useradd -ms /bin/bash alex \
    && echo alex:work | chpasswd \
    && adduser alex sudo


#fix emacs plugins
COPY emacs_plugins/ /home/alex/.emacs.d/plugins/
COPY .emacs /home/alex

WORKDIR /home/alex/.emacs.d/

#WORKDIR ~/
# we are not cloning since we want to get our own config.mk file in magit
RUN mkdir site-lisp
RUN mv /home/alex/.emacs.d/plugins/magit/ /home/alex/.emacs.d/site-lisp/

#RUN make

WORKDIR /home/alex/
USER alex

VOLUME /home/alex/dev

CMD /bin/bash
ENTRYPOINT
