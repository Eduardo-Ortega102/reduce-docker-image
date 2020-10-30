FROM node:10

WORKDIR /app

COPY app /app

RUN npm install -g webserver.local

RUN npm install && npm run build

EXPOSE 3000

CMD webserver.local -d ./build
