FROM ubuntu:24.04

# call user name
ARG USERNAME=bun \
    GROUPNAME=bun \
    UID=1000 \
    GID=1000

RUN userdel -r ubuntu && \
    apt-get update && \
    apt-get install -y \
    curl \
    unzip && \
    groupadd -g ${GID} ${GROUPNAME} && \
    useradd -m -s /bin/bash -u ${UID} -g ${GID} ${USERNAME}

USER ${USERNAME}

RUN curl -fsSL https://bun.sh/install | bash && \
    . /home/${USERNAME}/.bashrc
