FROM node:16.8 as BASE
WORKDIR /app
COPY . .
RUN yarn


