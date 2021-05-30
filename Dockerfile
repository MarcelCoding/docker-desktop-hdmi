FROM balenalib/aarch64-debian:buster

ENV USER=testuser
ENV PASSWD=mypassword

RUN export DEBIAN_FRONTEND=noninteractive \
 # configure user
 && apt-get update \
 && apt-get install -y sudo \
 && useradd --create-home --shell /bin/bash $USER \
 && echo $USER:$PASSWD | chpasswd \
 && echo $USER " ALL=(root) NOPASSWD:ALL" >> /etc/sudoers.d/$USER \
 && chmod 0440 /etc/sudoers.d/$USER \
 # install xserver, desktop, ALSA sound driver
 && apt-get install -y \
    xserver-xorg \
    xinit \
    xfce4 \
    xfce4-terminal \
    xserver-xorg-input-evdev \
    alsa-oss alsa-tools alsa-tools-gui alsa-utils alsamixergui mpg123 pulseaudio \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/*

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 #&& apt-get install -y \
#install pulseaudio
#    dbus-x11 pulseaudio \
# && sed -i -e 's;load-module module-console-kit;#load-module module-console-kit;' /etc/pulse/default.pa \
# && usermod -a -G audio $USER \
# && usermod -a -G pulse $USER \
# && usermod -a -G pulse-access $USER \
 && apt-get install -y \
#install chromium browser
    chromium \
#install screensaver
    xscreensaver \
 ## clean
 # && apt-get install libgles2* \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/*

#copy files
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

#set STOPSGINAL
STOPSIGNAL SIGTERM

#start container as non-root user, else chromium will not run
USER $USER
