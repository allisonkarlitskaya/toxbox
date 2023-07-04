FROM registry.fedoraproject.org/fedora:latest

RUN dnf install -y git tox && dnf clean all

COPY etc /etc

VOLUME /src
WORKDIR /src

ENV TOX_WORK_DIR /tmp/.tox
CMD tox
