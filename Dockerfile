#Only things I really should always want when working with things
FROM ubuntu:16.10

RUN apt-get -y update \
        && apt-get -y install \
        sudo \
        git \
        wget \
        emacs24 \
        make \
        autoconf \
        libtool-bin
        # &&  apt-get clean \
        # && rm -rf /var/lib/apt/lists/*

user root
RUN useradd -ms /bin/bash alex \
    && echo alex:work | chpasswd \
    && adduser alex sudo

#fix emacs plugins
COPY plugins/ /home/alex/.emacs.d/plugins/
COPY .emacs /home/alex

WORKDIR /home/alex/.emacs.d/

#WORKDIR ~/
#RUN make

WORKDIR /home/alex/

VOLUME /home/alex/dev

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils

RUN apt-get -y install clang-3.8 doxygen build-essential thrift-compiler python-virtualenv gcc-multilib wget curl

RUN apt-get -y install python-pip

RUN git config --global user.email "alex.telon@gmail.com" \
    && git config --global user.name "Alex Telon" 


# RUN virtualenv -p /usr/bin/python2.7 ~/checker_env
# RUN /bin/bash -c "source ~/checker_env/bin/activate" \
RUN git clone https://github.com/Ericsson/codechecker.git \
    && cd codechecker \
    && pip install -r .ci/basic_python_requirements \
    && ./build_package.py -o ~/codechecker_package

RUN mkdir fork && cd fork && git clone https://github.com/AlexTelon/codechecker.git && cd codechecker

USER alex
CMD /bin/bash
ENTRYPOINT
