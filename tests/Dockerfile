FROM ubuntu:25.04 AS testmachine

# Sets utf-8 encoding for Python et al
ENV LANG="fr_FR.UTF-8"

RUN useradd user && usermod -aG audio,disk,lp,root,sudo user
RUN mkdir /home/user && chown user:user -R /home/user && mkdir /etc/sudoers.d
RUN echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/userconf
RUN apt-get update && apt-get install -y zsh curl wget git sudo

LABEL maintainer="yttion" \
      vendor="yttrion" \
      description="doomnvim container for testing"

#COPY bin/docker-entrypoint.sh /
#RUN chmod +x /docker-entrypoint.sh
USER user
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
WORKDIR /home/user

# default command: display Ansible version
#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD [ "/bin/zsh" ]
