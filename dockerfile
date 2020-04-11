FROM node:10-alpine

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
COPY lerna.json ./
COPY packages/shared ./packages/shared
COPY packages/app-one ./packages/app-one

RUN npm install
RUN npm run bootstrap
CMD ["npm", "run", "app-one:start"]
