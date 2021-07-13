FROM node:10.16.0-alpine

# 在容器中创建一个目录
RUN mkdir -p /usr/src/app

# 定位到容器的工作目录
WORKDIR /usr/src/app

COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/

RUN npm config set registry https://registry.npm.taobao.org/

RUN npm config set unsafe-perm true
RUN npm i --production
RUN npm install pm2 -g

# RUN npm i --production --registry=https://registry.npm.taobao.org

# 把当前目录下的所有文件拷贝到 Image 的 /usr/src/nodejs/ 目录下
COPY . /usr/src/app

# RUN npm config set registry https://registry.npm.taobao.org/ && npm i -g pm2 --no-optional
EXPOSE 3000
#pm2在docker中使用命令为pm2-docker
CMD ["pm2-docker", "start", "--json", "process.json"]