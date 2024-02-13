FROM node:21-alpine3.18
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json", "index.js", "./"]

RUN npm install --omit-dev 
RUN npm i -g pm2

CMD ["sh","-c","pm2 start index.js && exit 0"]