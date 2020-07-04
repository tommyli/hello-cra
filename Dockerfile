FROM node:12.18.2-alpine

WORKDIR /hello-cra

COPY package.json yarn.lock /hello-cra/

RUN yarn install --frozen-lockfile

RUN yarn global add serve

COPY public /hello-cra/public

COPY src /hello-cra/src

RUN yarn build --quiet

CMD ["serve", "-s", "build"]
