FROM ubuntu:jammy as base
WORKDIR /usr/local/bin
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base as loonskai
ARG TAGS
RUN addgroup --gid 1000 loonskai
RUN adduser --gecos loonskai --uid 1000 --gid 1000 --disabled-password loonskai
USER loonskai
WORKDIR /home/loonskai

FROM loonskai
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
