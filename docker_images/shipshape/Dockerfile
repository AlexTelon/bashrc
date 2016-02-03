FROM ubuntu:15.10

RUN apt-get -y update \
        && apt-get -y install \
        sudo \
        wget \
        maven \
        bison \
        clang \
        flex \
        golang \
        openjdk-8-jdk \
        openjdk-8-source \
        pkg-config \
        zip \
        g++ \
        zlib1g-dev \
        unzip \
        emacs24 \
        &&  apt-get clean \
        && rm -rf /var/lib/apt/lists/*

#seems like this is sometimes needed
ENV GOROOT /usr/local/go
ENV PATH /usr/local/go/bin:$PATH

WORKDIR /usr/local/

RUN mkdir /shipshape \
    && cd /shipshape \
    && wget -O shipshape_dl https://github.com/google/shipshape/archive/release-2015-11-17.tar.gz \
    && tar -xvf shipshape_dl \
    && rm shipshape_dl

#Install bazel
RUN groupadd -r build \
        && useradd -m -g build bazel

USER bazel
WORKDIR /home/bazel

RUN wget -O bazel-install.sh \
        https://github.com/bazelbuild/bazel/releases/download/0.1.4/bazel-0.1.4-installer-linux-x86_64.sh \
            && chmod 700 bazel-install.sh \
                && ./bazel-install.sh --user \
                    && rm bazel-install.sh

ENV BAZEL_BIN=/home/bazel/bin
ENV PATH=$PATH:$BAZEL_BIN

# RUN cd /usr/local/shipshape/shipshape-release-2015-11-17/shipshape/ \
    #     && ./update-dependencies.sh \
    #     && touch output.log \
    #     && ./build-plugin.sh > output.log 2>&1; exit 0

#add user and add sudo to apt-gets
user root
RUN useradd -ms /bin/bash alex \
        && adduser alex sudo

USER alex
WORKDIR /home/alex

#fix emacs plugins
COPY ../../emacs_plugins ~/.emacs.d/plugins/
COPY ../../.emacs ~/

ENTRYPOINT
