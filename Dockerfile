FROM cimg/node:16.8 as BASE
COPY . .
RUN yarn 
RUN yarn build

FROM cimg/node:16.8 as BUILD
WORKDIR /cache/build
COPY --from=0 /home/circleci/project/package.json .
COPY --from=0 /home/circleci/project/yarn.lock .
COPY --from=0 /home/circleci/project/node_modules ./node_modules
