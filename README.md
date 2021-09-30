
## 平台简介

　　该智能开关平台包括服务端、硬件端、PC端和安卓端。硬件使用ESP8266模块，成本相对较低，可以发挥想象力，搭配各种传感器，实现自己的智能终端。【------[演示视频看这里 B站传送门](https://www.bilibili.com/video/BV1Qg4y1q7nk?from=search&seid=16334091011357696233)------】

**应用场景**：智能开关的应用场景比较广泛，一般家里通电即可使用的设备都能搭配该模块，升级为网络版，进行联网控制。常见的就是智能开关、智能插座和智能灯，搭配土壤湿度传感器可以实现智能浇灌，搭配温湿度传感器可以监控温湿度，其他传感器例如：触控开关、雨滴探测、声音传感器、光敏传感器、烟雾传感器、火焰报警、人体感应等等。

![场景](https://gitee.com/kerwincui/kwswitch/raw/master/document/0.png)
  
**智能开关目前支持的功能**：
- 远程控制
- 掉电记忆
- 触控开关
- 红外遥控
- 温湿度监测
- 本地控制
- 单双路继电器支持
- 智能配网（长按配置按钮进入）
- 不联网模式（双击配置按钮切换）
- 定时执行 （待完成...）
- 语音控制 （待完成...）
- 云端升级 （待完成...）
    
<br /> 
 
## 技术栈
* 该项目前后端基于[若依权限管理系统](https://gitee.com/y_project/RuoYi-Vue)
* 开关的硬件使用[贝壳物联](https://www.bigiot.net/)的Wifi继电器模块
* 安卓端使用乐鑫的[EspTouch](https://github.com/EspressifApp/EsptouchForAndroid)和[讯飞](https://www.xfyun.cn/)的语音SDK   
    
    
#### 平台架构图：
![平台架构图](https://gitee.com/kerwincui/kwswitch/raw/master/document/1.png)  

#### 项目结构图：
![项目结构图](https://gitee.com/kerwincui/kwswitch/raw/master/document/01.png) 
    
#### 后端
* 相关技术：Spring boot、MyBatis、Spring Security、Jwt、Mysql、Redis、Mongodb、MQTT
* 开发工具：IDEA
    
#### 前端
* 相关技术：ES6、Vue、Vuex、Vue-router、Vue-cli、Axios、Element-ui
* 开发工具：Visual Studio Code
    
#### 安卓
* 相关技术：Smartconfig、GSON、OkHttp、讯飞语音
* 开发工具：Android Studio
    
#### 硬件端
* 相关技术： Arduino、 ESP8266 core for Arduino、OneButton、IRromoteESP8266、PubSubClient
* 开发工具：Arduino IDE、Visual Studio Code
* 辅助工具：USB转TTL下载线、AC-DC降压模块（可选）、红外遥控模块（可选）、DHT11温湿度传感器（可选）、触控开关（可选）
* 硬件图片：硬件图片来自贝壳物联官网<br />
![硬件图片](https://gitee.com/kerwincui/kwswitch/raw/master/document/2.jpg)
* 硬件电路图：<br />
![硬件](https://gitee.com/kerwincui/kwswitch/raw/master/document/3.jpg)    
* 电路接线图：（默认5V电压，如果要接220V交流电，需要搭配一个AC-DC降压模块）<br />
![硬件](https://gitee.com/kerwincui/kwswitch/raw/master/document/4.png)
   
<br /><br />  
## 演示图
![演示](https://gitee.com/kerwincui/kwswitch/raw/master/document/5.png)
![演示](https://gitee.com/kerwincui/kwswitch/raw/master/document/6.png)
![演示](https://gitee.com/kerwincui/kwswitch/raw/master/document/7.png)
![演示](https://gitee.com/kerwincui/kwswitch/raw/master/document/8.jpg)

<br /><br />
## Docker安装相关容器的命令
　　下面是linux系统下安装相关容器的命令，windows下修改命令中的换行符号和挂载卷路径。这些命令可以方便你开发和部署，你也可以使用dockerfile、docker-compose.yml或者自己的镜像。当然不用docker也是可以的，只是一个一个装应用麻烦些。

  
* mysql安装（有账号和密码）
```
1.安装软件
docker run \
　　 --name mysql \
    --publish 3306:3306 \
    --volume /var/data/mysql/mysql:/var/lib/mysql \
    --env MYSQL_DATABASE="databaseName" \
    --env MYSQL_USER="root" \
    --env MYSQL_ROOT_PASSWORD=123456 \
    --restart always \
    --detach \
 mysql:5.7 \
     --character-set-server=utf8 \
     --collation-server=utf8_unicode_ci 

2.进入容器
docker exec -it containId /bin/bash

3.修改配置文件，设置编码
tee /etc/mysql/conf.d/mysql.cnf <<-'EOF'
[client]
default-character-set=utf8
 
[mysql]
default-character-set=utf8
EOF

4.可选:设置mysql小写模式，vim /etc/mysql/mysql.conf.d/mysql.cnf，在[mysqld]下加入一行：lower_case_table_names=1
```

* redis安装（有密码）
```
docker run \
　　--name redis \
　　--restart always \
 　 --publish 6379:6379 \
　　--volume /var/data/redis/data:/data \
　　--detach \　
redis \
　　--requirepass "123456" \
　　--appendonly yes
```

* mongodb安装（有账号密码）
```
docker run \
    --name mongo \
    --env MONGO_INITDB_ROOT_USERNAME=root \
    --env MONGO_INITDB_ROOT_PASSWORD=123456 \
    --volume /var/data/mongodb:/data/db \
    --publish 27017:27017 \
    --restart unless-stopped \
    --detach \
mongo:4.0

提示：mongodb使用时，先创建库，然后一定要在对应库中创建用户和角色，不然创建的用户连接不上对应数据库。
```

* mosquitto安装（有账号密码，Mqtt的Broker）
```
1.安装软件
docker run \
   --name mosquitto \
   --privileged \
   --publish 1883:1883 \
   --publish 9001:9001 \
   --volume /var/data/mosquitto/data:/mosquitto/data \
   --volume /var/data/mosquitto/log:/mosquitto/log \
   --restart always \
   --detach \
eclipse-mosquitto
 

2.进入容器：docker exec -it name sh

3.编辑配置文件：vi /mosquitto/config/mosquitto.conf
　　# 关闭匿名模式
　　allow_anonymous false
　　# 指定密码文件
　　password_file /mosquitto/config/pwfile.conf

4.生成密码：
　　#使用mosquitto_passwd命令创建用户，第一个admin是用户名，第二个admin是密码
　　mosquitto_passwd -b /mosquitto/config/pwfile.conf admin admin

5.退出容器使用并重启容器：
　　#退出容器
　　exit
　　#重启容器
　　docker restart mosquitto
```









