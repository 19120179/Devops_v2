FROM node:18.13.0

ENV NODE_ENV=production

WORKDIR /app/

COPY /project/ .

EXPOSE 3000

RUN npm install

