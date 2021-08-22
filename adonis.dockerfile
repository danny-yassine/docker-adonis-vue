FROM node:14

WORKDIR /usr/src/api

# install yarn
# RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm
RUN npm install -g yarn --force