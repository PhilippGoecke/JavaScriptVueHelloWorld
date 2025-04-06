FROM docker.io/node:lts-bookworm-slim as build

WORKDIR /vue-app

RUN node -v
RUN npm --version
RUN npx --version

RUN npm install -g @vue/cli \
  && npm v vue \
  && vue --version

RUN vue create hello-vue --default --no-git \
  && ls -lisah

WORKDIR /vue-app/hello-vue

RUN npm install

EXPOSE 8080

CMD vue serve
