FROM fedora:23
MAINTAINER Emory Merryman
ENV LUSER="emory" UID="1001" GID="1001"
RUN dnf update --assumeyes && dnf install --assumeyes git curl java emacs && dnf update --assumeyes && dnf clean all
RUN curl --output /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod 0555 /usr/local/bin/lein
RUN groupadd ${LUSER} --gid ${GID} && useradd --create-home ${LUSER} --uid ${UID} ${LUSER} --gid ${GID} ${LUSER}
USER ${LUSER}
VOLUME /home/${LUSER}/working
VOLUME /home/${LUSER}/.ssh
RUN /usr/local/bin/lein
CMD /usr/bin/emacs
