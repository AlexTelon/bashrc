#following the instructions at github.com/ericsson/codechecker with some additions like apt-get clean and such to keep it lightweight
From ubuntu:14.04

RUN apt-get update \
    && apt-get install -y \
    clang-3.6 \
    libpq-dev \
    postgresql \
    postgresql-client-common \
    postgresql-common \
    doxygen \
    build-essential \
    thrift-compiler \
    python-virtualenv \
    python-dev \
    gcc-multilib \
    git \
    &&  apt-get clean \
    && rm -rf /var/lib/apt/lists/*



ENTRYPOINT
