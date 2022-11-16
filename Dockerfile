FROM node:16 as BASE

WORKDIR /app

COPY . .

RUN yarn 
RUN yarn build

FROM node:16 as BUILD

WORKDIR /app

COPY --from=0 /app/package.json .
COPY --from=0 /app/yarn.lock .

COPY --from=0 /app/node_modules ./node_modules
COPY --from=0 /app/backend ./backend
COPY --from=0 /app/frontend ./frontend
COPY --from=0 /app/packages ./packages

ENTRYPOINT [ "/bin/bash" ]





