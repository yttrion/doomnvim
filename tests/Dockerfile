FROM ubuntu:25.04 AS testmachine

# Sets utf-8 encoding for Python et al
ENV LANG="fr_FR.UTF-8"

RUN apt-get update

LABEL maintainer="yttion" \
      vendor="yttrion" \
      description="doomnvim container for testing"

COPY bin/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# default command: display Ansible version
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [ "/bin/bash" ]

