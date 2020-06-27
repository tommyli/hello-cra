FROM node:12.18.1

WORKDIR /cra

COPY build /cra/build

RUN yarn global add serve

CMD ["serve", "-s", "build"]
