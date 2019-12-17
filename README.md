# hadoop-docker

**Thanks to  [big-data-europe/docker-hadoop](https://github.com/big-data-europe/docker-hadoop)** 

本项目在[big-data-europe/docker-hadoop](https://github.com/big-data-europe/docker-hadoop)的基础上进行更改,主要变动如下：

* debian -> centos
* 使用了国内镜像[tuna mirrors](https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/)，加快build速度
* 进行了部分定制化

## Quick Start

```shell
docker-compose up
```

## Access

* Namenode: http://<Namenode_IP_address>:9870/dfshealth.html#tab-overview
* History server: http://<History_server_IP_address>:8188/applicationhistory
* Datanode: http://<Datanode_IP_address>:9864/
* Nodemanager: http://<Nodemanager_IP_address>:8042/node
* Resource manager: http://<Resource manager_IP_address>:8088/

## build images

```shell
./buildall.sh
```

