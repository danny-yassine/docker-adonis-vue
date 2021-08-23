FROM node:14

COPY ./api /usr/src/api

WORKDIR /usr/src/api

# install yarn
RUN npm install -g yarn --force

RUN yarn
# or using npm
# RUN npm ci --production

RUN node ace build --production

RUN ENV_SILENT=true HOST=0.0.0.0 node build/server.js