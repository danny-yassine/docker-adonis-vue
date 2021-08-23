FROM node:14

COPY ./api /usr/src/api

WORKDIR /usr/src/api

# install yarn
RUN npm install -g yarn --force

RUN yarn
# or using npm
# RUN npm ci --production

RUN node ace build --production

RUN touch ./build/.env
RUN echo "HOST=0.0.0.0" >> ./build/.env
RUN echo "PORT=$PORT" >> ./build/.env
RUN cat ./build/.env

RUN ENV_SILENT=true HOST=0.0.0.0 PORT=$PORT node ./build/server.js