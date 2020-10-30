FROM node:10-alpine AS build
WORKDIR /app
COPY app /app
RUN npm install && npm run build


FROM node:10-alpine
WORKDIR /app
RUN npm install -g webserver.local
COPY --from=build /app/build ./build

EXPOSE 3000
CMD webserver.local -d ./build