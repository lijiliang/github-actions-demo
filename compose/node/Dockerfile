FROM node:12-alpine
WORKDIR /code
COPY ./package.json ./server.js ./process.json /code/
COPY ./static /code/static
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& apk update && apk add yarn \
	&& yarn config set registry https://registry.npm.taobao.org/ \
	&& yarn
# CMD ["npm", "start"]

RUN yarn global add pm2

#pm2在docker中使用命令为pm2-docker
CMD ["pm2-docker", "start", "--json", "process.json"]