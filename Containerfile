FROM debian:trixie-slim as build

ARG DEBIAN_FRONTEND=noninteractive

#SHELL ["/bin/bash", "-c"]
RUN rm /bin/sh \
  && ln -s /bin/bash /bin/sh

# install dependencies
RUN apt update && apt upgrade -y \
  && apt install -y --no-install-recommends --no-install-suggests ca-certificates git curl libssl-dev zlib1g-dev \
  && rm -rf "/var/lib/apt/lists/*" \
  && rm -rf /var/cache/apt/archives

# install Node.js
ENV NODE_VERSION=24.12.0
ENV HOME="/root"
ENV PATH="$HOME/.nvm/versions/node/v$NODE_VERSION/bin/:$PATH"
RUN git clone --depth 1 https://github.com/nvm-sh/nvm.git ~/.nvm \
  && source $HOME/.nvm/nvm.sh \
  #&& echo "\nexport NVM_DIR=\"$HOME/.nvm\"\n[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"\n[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"" >> ~/.bash_rc \
  && nvm --version \
  && nvm install $NODE_VERSION \
  && which node \
  && node --version \
  && npm --version \
  && npm install --global yarn \
  && which yarn \
  && yarn --version \
  && npm update -g npm

WORKDIR /vue-app

RUN node -v
RUN npm --version
RUN npx --version

RUN npm install -g @vue/cli \
  && npm v vue \
  && vue --version

RUN vue create hello-vue --default --no-git

WORKDIR /vue-app/hello-vue

RUN npm install -g http-server

RUN npm install

RUN npm run build

#EXPOSE 8080

#CMD [ "http-server", "dist" ]

FROM docker.io/nginx:stable-trixie

EXPOSE 80

COPY --from=build /vue-app/hello-vue/dist /usr/share/nginx/html
