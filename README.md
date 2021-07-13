
## jenkins配置

### Build
```bash
#npm install -g @vue/cli
# rm -rf node_modules
#npm install -g cnpm --registry=https://registry.npm.taobao.org
#cnpm install
#npm i copy-webpack-plugin
npm install --registry=https://registry.npm.taobao.org
npm run build:beta
cd ./dist/
sleep 1s
sudo tar -zcvf ../kyani_erp_admin.zip *
```

### Send build artifacts over SSH

Source files: kyani_erp_admin.zip
Remote directory: release/kyani_erp_admin

Exec command 配置如下：
```bash
sudo mkdir /data/www
sudo mkdir /data/www/kyani_erp_admin
sudo tar -xvf /home/centos/release/kyani_erp_admin/kyani_erp_admin.zip -C  /data/www/kyani_erp_admin/
sudo chmod 777 /data/www/kyani_erp_admin/bin/run-beta.sh
sudo chmod 777 /data/www/kyani_erp_admin/bin/docker-run-beta.sh
sudo sh /data/www/kyani_erp_admin/bin/docker-run-beta.sh
```