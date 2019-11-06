---
layout: post
title: 为比特币现金升级做好准备
subtitle: 升级将于11月15日激活
multiLangId: 2019-10-30-upgrade-reminder
lang: zh_simple
---

## 发生什么了？

在不到两星期内，2019年11月15日，比特币现金网络将会进行一次预定升级。此次常规升级是在[比特币现金蓝图](https://www.bitcoincash.org/roadmap.html)计划内的。

## 我需要做些什么？

所有运营节点需要将其软件升级到最新版本。对于Bitcoin ABC用户，这意味着版本0.20.0或者更新，可[在此下载](https://download.bitcoinabc.org/)。

任何用来跑区块浏览器，交易所，或者基于完整节点的服务，也需要升级。

普通用户无需操作。钱包不受此次升级影响，且会保持正常功能。

## 如果不升级会怎样？

老版本Bitcoin ABC（0.19.x）在11月15号后将会不再和比特币现金网络兼容。任何不升级的节点会以不影响升级网络的方式继续运营，它们在11月15号后会与升级节点安全分离。这意味着如果你想要继续使用比特币现金网络节点的话就必须升级。

## 升级包含哪些详情？

十一月升级的技术参数可以 [在此查看](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md)。

此次升级会激活两个功能：
 * [OP_CHECKMULTISIG(VERIFY) Schnorr 签名](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md)。上次升级新增了在 OP_CHECKSIG 和 OP_CHECKDATASIG 中使用Schnorr签名的功能, 这轮将追加 OP_CHECKMULTISIG。 升级后，所有签名验证都将支持 Schnorr。
 * [在交易脚本中执行 MINIMALDATA 规定](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md。这将去除最后的BIP62可塑性问题, 升级后绝大多数比特币现金的交易 (包括所有 P2PKH 交易) 将不再可塑。

这些功能允许其他高级功能，比如 [隐藏智能合约](https://youtu.be/6V98Q4FnSY0)。比特币现金的普通用户不会被影响。

## 还有什么其他信息？

帮助此次技术升级，[测试网络](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md)可被用于测试与试用。
此 testnet 可用于测试相容性，或提前开发使用新功能的产品。

如有任何疑问，请与我们联系[邮件](mailto:info@bitcoinabc.org)。
对在Bitcoin ABC做开发感兴趣可加入[Telegram群聊](https://t.me/joinchat/HCYr50mxRWjA2uLqii-psw)。
