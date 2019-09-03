---
layout: post
title: 为2019年11月比特币现金协议升级做准备，下载 Bitcoin ABC 0.20.0
subtitle: 2019年11月协议升级现已锁定
multiLangId: 2019-08-21-bitcoin-abc-0-20-0
lang: zh_simple
---

Bitcoin ABC的目标是参与打造全世界都可用的健全货币，为经济自由及繁荣做贡献。我们持续地在[比特币现金开发的路线图](https://www.bitcoincash.org/zh-CN/roadmap.html)上扮演重要的角色。

為此，Bitcoin ABC 团队 Bitcoin ABC团队很高兴能推出与2019年11月协议升级相容的版本。Bitcoin ABC 0.20.0 现已发布，可于此下载: [https://download.bitcoinabc.org/0.20.0/](https://download.bitcoinabc.org/0.20.0/)

每一次协议升级的新功能都有提前计划，制定规格 [1] 与开发，好让所有比特币现金生态系统的参与者有充足的时间准备。与上次升级一样， Bitcoin ABC 0.20.0 在2019年11月15日升级前三个月就先发布>。
本次升啟用后，将增加以下功能:
* **OP_CHECKMULTISIG(VERIFY) Schnorr 签名** [2]: 上次升级新增了在 OP_CHECKSIG 和 OP_CHECKDATASIG 中使用Schnorr签名的功能, 这轮将追加 OP_CHECKMULTISIG。 升级后，所有签名验证都将支持 Schnorr。
* **在交易脚本中执行 MINIMALDATA 规定** [3]: 这将去除最后的BIP62可塑性问题, 升级后绝大多数比特币现金的交易 (包括所有 P2PKH 交易) 将不再可塑。

为做升级相关的技术准备, 我们建了一个可供实验新功能的测试链(testnet) [4]。此 testnet 可用于测试相容性，或提前开发使用新功能的产品。

通过对协议进行优化与升级，我们能让点对点电子现金在现有限制之上再扩容许多个量级。比特币现金必须继续改进，才能保有竞争力。我们Bitcoin ABC团队很高兴能继续参与比特币现金的基础建设，让她能成为全世界最优良的货币。

### Reference Links
[1] [November 2019 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md)  
[2] [Specification for Schnorr Signatures in OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md)  
[3] [Specification for Enforcing MINIMALDATA in Script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md)  
[4] [Testnet Information](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md)  
