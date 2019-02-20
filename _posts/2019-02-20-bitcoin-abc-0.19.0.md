---
layout: post
title: Prepare for the Bitcoin Cash protocol upgrade with Bitcoin ABC 0.19.0
subtitle: May 15th 2019 protocol upgrade is now locked in
multiLangId: 2019-02-20-bitcoin-abc-0-19-0
lang: en
---

The goal of Bitcoin ABC is to help create sound money that is usable globally in order to drive freedom and prosperity for everyone. This [vision](/2018-08-24-bitcoin-abc-vision) has not changed.

Keeping in line with the [Bitcoin Cash roadmap](https://www.bitcoincash.org/roadmap.html), the Bitcoin ABC team is proud to present the May 2019 protocol upgrade release. Bitcoin ABC 0.19.0 is now available and can be downloaded at: [https://download.bitcoinabc.org/0.19.0](https://download.bitcoinabc.org/0.19.0/)

The features going into every protocol upgrade are planned, specified [[1]](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-upgrade.md), and developed far in advance in order to give users, businesses, miners, and all other ecosystem participants ample time to prepare. In order to assist technical preparations for the upgrade, a testnet is available where the upgrade features can be trialed and tested. Businesses and services built on the Bitcoin Cash network can use this testnet to ensure compatibility, or to get started building products to make use of the upgrade features. Testnet information is available [here](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-05-15_upgrade_testnet.md).

Similar to the last upgrade, the Bitcoin ABC 0.19.0 release has been made available three months in advance of the upgrade activation, which is scheduled to occur on May 15th, 2019. The protocol upgrade, once activated, will enable the following features:
* **Schnorr signatures** [[2]](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-schnorr.md) for enhanced privacy and performance, for both single- and multiple-signature transactions.
* **Segwit recovery transactions** [[3]](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-segwit-recovery.md).  With the last protocol upgrade, the enforcement of the CLEANSTACK rule made it impossible to recover funds from Segwit transactions.  With the upgrade, there will be an exception to this rule to enable recovery of these funds once again.

We believe that the basic design of Bitcoin Cash is sound, and does not need radical changes. However, this does not mean it is perfect. It is prudent to make incremental improvements to the system with technically sound design and careful engineering. By implementing optimizations and protocol upgrades, we can enable peer-to-peer digital cash to scale many orders of magnitude beyond current limits.

To become a solid base for application development and innovation, Bitcoin Cash needs to continuously improve and compete. At Bitcoin ABC, we are working diligently building a technical foundation to empower Bitcoin Cash to be the best money the world has ever seen.

### Reference Links
[1] [May 2019 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-upgrade.md)  
[2] [Schnorr Signature Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-schnorr.md)  
[3] [Segwit Recovery Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-05-15-segwit-recovery.md)  
[4] [Upgrade Testnet Information](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-05-15_upgrade_testnet.md)  
