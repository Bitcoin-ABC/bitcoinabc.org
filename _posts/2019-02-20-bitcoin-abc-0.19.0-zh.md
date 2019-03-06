---
layout: post
title: Bitcoin ABC 0.19.0 版本比特币现金协议的升级的准备
subtitle: 2019年5月15日协议升级计划已确定
multiLangId: 2019-02-20-bitcoin-abc-0-19-0
lang: zh_simple
---

Bitcoin ABC的目标是创造出高流通性并给大众带来财富的国际化货币。这一[使命远景](/2018-08-24-bitcoin-abc-vision-zh)从未改变。

Bitcoin ABC团队很荣幸地宣布此次2019年五月协议升级，此次升级依然与[比特币现金的蓝图](https://www.bitcoincash.org/roadmap.html)保持一致。  Bitcoin ABC 0.19.0现已发布，请在此下载：[https://download.bitcoinabc.org/0.19.0](https://download.bitcoinabc.org/0.19.0/)

每次协议升级，我们会对新产品和功能都会做详细周全的准备以及发布规格[[1]](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-upgrade.md), 及早给用户，商家，矿工，和系统里其他参与者提供试用版，以便有所准备。 所有的功能可在testnet（试用网）上试用。基于比特币现金的商家和服务可用这一testnet来确保产品升级可用，或者利用此网络来开发新产品。Testnet的信息[在此](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-05-15_upgrade_testnet.md)。

和上次升级类似，Bitcoin ABC 0.19.0在2019年5月15号正式升级前的三个月提前发布。协议一旦正式启用后，将有如下功能：
* **Schnorr signatures** [[2]](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-schnorr.md)提高单一签名和多重签名交易的隐私和性能
* **Segwit交易可被逆转** [[3]](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-segwit-recovery.md)。上次协议升级时，强制CLEANSTACK规则导致Segwit交易不可逆转。此次升级将带来一个可将交易逆转的特例功能。

我们相信比特币现金的基本设计是没问题的，但是这不代表其是完美的。详密的技术设计和阶段性的产品提高至关重要。通过优化和产品升级，我们可以帮助peer-to-peer电子现金实现更高级别的规模化。

为了成为应用开发和创新的平台，比特币现金需要不断努力和完善。Bitcoin ABC的团队，每个人都精益求精，立志将比特币现金做成世界上最好的货币。

### 参考文献
[1] [May 2019 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-upgrade.md)  
[2] [Schnorr Signature Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-schnorr.md)  
[3] [Segwit Recovery Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-segwit-recovery.md)  
[4] [Upgrade Testnet Information](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-05-15_upgrade_testnet.md)  
