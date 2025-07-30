FROM node:22-bullseye

RUN mkdir -p /app
COPY package.* /app
WORKDIR /app
RUN npm install
COPY . /app

EXPOSE 3001
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT [ "/app/entrypoint.sh" ]