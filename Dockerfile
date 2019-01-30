FROM node:latest as build
LABEL maintainer="Frank Lemanschik <frank@dspeed.eu>"

RUN buildDeps='make build-essential g++ gcc python2.7' && softDeps="tmux git" \
 && apt-get update && apt-get upgrade -y \
 && apt-get install -y $buildDeps $softDeps --no-install-recommends \
 && npm install -g forever && npm cache clean --force \
 && git clone --depth=1 https://github.com/c9/core.git /srv/cloud9 && cd /srv/cloud9 \
 && scripts/install-sdk.sh \
 && apt-get purge -y --auto-remove $buildDeps \
 && apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && npm cache clean --force \
 && git reset --hard
 
VOLUME /workspace
EXPOSE 8181 
ENTRYPOINT ["forever", "/srv/cloud9/server.js", "-w", "/workspace", "--listen", "0.0.0.0"]

CMD ["--auth","c9:c9"]
