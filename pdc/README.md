# Personal Data Center 

这是配置个人数据中心（PDC），mywallet/KMS、PDSS，以及启动服务的步骤说明。


## 如何使用

### 第一步：安装基础软件 [done]
用quick_install.sh安装必备的基础软件：
    - Docker 14+
    - Docker-compose
    - nodejs 10+
    - go
    - kubectl
    - helm
    - curl
    - jq
    - snapd
    - minikube 

```bash
$ cd pdc
$ ./quick_install.sh [done]
```

### 第二步：配置个人数据中心环境
主要完成个人KMS、个人区块链和数据空间的安装和配置。
    - vault
    - consul
    - datomspace
    - personal-blockchain 
    - k8s pod配置

```bash
$ ./config_myPDC.sh
```

初始配置：
    - DID
   


### 第三步：安装应用App
安装个人数据空间管理系统（PDSS）。
- PDSS包括：
    - 存储: 可选：IPFS/pds（raft等HA云存储）[todo] 
    - 数据资产管理back-end: [todo]
    - 数据资产目录：[todo]
    - 数据权利行权、维权工具和服务back-end [todo]
    - datomspod【可选】：数据资产安全、可信和隐私增强保护的交付工具。[done]
- 每个服务都提供endpoint,向前端提供服务。


#### 第四步：back-end启动/运行
运行自动化脚本，初始化和启动所有服务。[todo]

```bash
$ ./start.sh   //启动全部服务  
$ ./stop.sh    //停止服务 --flag选项
$ ./resume.sh  //恢复服务 --flag选项
$ ./remove.sh  //删除全部服务，系统返回到VPDC初始状态。
```

#### 第五步：Front—End[todo]
1. 用户通过任何设备上的浏览器，登录back-end的endpoint/url, 进行初始化设置。
    
2. 完成设置后，开始使用各个endpoint服务。

