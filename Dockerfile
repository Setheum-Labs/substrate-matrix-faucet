FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
curl software-properties-common

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get install -y nodejs && chmod -R 777 /usr/local/bin
RUN npm install --global yarn@1.22.5

WORKDIR /faucet

COPY . .
COPY package.json .
RUN yarn install

ENTRYPOINT ["yarn"]
