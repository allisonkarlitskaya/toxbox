FROM registry.fedoraproject.org/fedora:latest

RUN \
    set -eux; \
    dnf install -y \
         git \
         tox \
         util-linux\
         ; \
    useradd -u 50674 tox; \
    dnf clean all; \
    :

COPY etc /etc

VOLUME /src
WORKDIR /src

ENV TOX_WORK_DIR /tmp/.tox
ENV COVERAGE_FILE /tmp/.coverage
ENV RUFF_CACHE_DIR /tmp/.ruff_cache
ENV MYPY_CACHE_DIR /tmp/.mypy_cache

CMD tox
