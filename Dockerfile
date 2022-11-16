FROM cimg/node:16.8 as BASE
WORKDIR /app
COPY . .
RUN yarn 
RUN yarn build

FROM cimg/node:16.8 as BUILD
WORKDIR /cache/build
COPY --from=0 /app/package.json .
COPY --from=0 /app/yarn.lock .
COPY --from=0 /app/node_modules ./node_modules
