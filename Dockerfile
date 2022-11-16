FROM node:16.8 as BASE
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn 

FROM node:16.8 as BUILD
WORKDIR /cache
COPY --from=0 /app/node_modules ./node_modules
