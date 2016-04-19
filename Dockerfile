FROM fedora:23
MAINTAINER Emory Merryman
ENV LUSER emory UID 1001 GID 1001
RUN dnf update --assumeyes && dnf install --assumeyes curl java emacs && dnf update --assumeyes && dnf clean all
RUN curl --output /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod 0555 /usr/local/bin/lein
RUN useradd --create-home ${LUSER} && usermod --uid ${UID} ${LUSER} && usermod --gid ${GID} ${USER}
USER ${LUSER}
RUN /usr/local/bin/lein
VOLUME /home/emory/working
CMD /usr/bin/emacs
