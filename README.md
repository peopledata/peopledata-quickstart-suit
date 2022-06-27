# Personal Data Center 

这是配置个人数据中心（PDC），mywallet/KMS、PDSS，以及启动服务的步骤说明。


## 第一步：安装基础软件 [done]
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

## 第二步：配置个人数据中心环境
主要完成个人KMS、个人区块链和数据空间的安装和配置。
    - vault/kms
    - verixyz
    - datomspace
    - personal-blockchain 
    - k8s pod配置

```bash
$ ./config_pdc.sh
```

#### 初始配置：
    1. pods的部署
    自动化部署完成

    2. vault/KMS
    采用2级key管理体系。用户需要用编写硬件或手动输入初始pin，启动root vault；
    然后由root vault启动vault-in-pod，创建和管理keys；

    3. verixyz
    DID和VCs工具。按照需要使用服务。 

    4. datomspace
    个人数据资产化以及管理

    5. personal-blockchain
    个人数据资产token化存证，智能合约运行等。
    [a] attach metachain： 通过添加metachain的一个vaildator节点，来实现个人链的可信治理；
    [b] unattach metachain: 完全私有的个人链。


## 第三步：安装应用App
必选应用：个人数据空间管理系统（PDSS）。
- PDSS包括：
    - 存储: 可选：IPFS/pds（raft等HA云存储）[todo] 
    - 数据资产管理back-end: [todo]
    - 数据资产目录：[todo]
    - 数据权利行权、维权工具和服务back-end [todo]
    - datomspod【可选】：数据资产安全、可信和隐私增强保护的交付工具。[done]
- 每个服务都提供endpoint,向前端提供服务。

可选应用：数据DAO（dataDAO）
- dataDAO:
    - 由某一个赞助者、支持者发起设立的数据合作组织；
    - 授权使用个人的某类数据资产;
    - 以dataNFT的方式向DAO转入数据资产。



## 第四步：back-end启动/运行
运行自动化脚本，初始化和启动所有服务。[todo]

```bash
$ cd back_end   
$ ./start.sh   //启动全部服务  
$ ./stop.sh    //停止服务 --flag选项
$ ./resume.sh  //恢复服务 --flag选项
$ ./remove.sh  //删除全部服务，系统返回到VPDC初始状态。
```

## 第五步：Front—End（个人dashboard）
1. 用户通过任何设备上的浏览器，登录back-end的endpoint/url, 进行初始化设置。    
2. 完成设置后，开始使用各个endpoint服务。
采用[patronus](https://github.com/peopledata/patronus)作为个人用户的UI和dashoborad。


