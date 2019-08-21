---
layout: post
title: Prepare for the Bitcoin Cash protocol upgrade with Bitcoin ABC 0.20.0
subtitle: November 15th 2019 protocol upgrade is now locked in
multiLangId: 2019-08-21-bitcoin-abc-0-20-0
lang: en
---

The goal of Bitcoin ABC is to help create sound money that is usable globally in order to drive freedom and prosperity for everyone.  Bitcoin ABC continues to be a driving force in executing on the [roadmap for Bitcoin Cash](https://www.bitcoincash.org/roadmap.html).

Keeping in line with this vision, the Bitcoin ABC team is proud to present the November 2019 protocol upgrade release. Bitcoin ABC 0.20.0 is now available and can be downloaded at: [https://download.bitcoinabc.org/0.20.0/](https://download.bitcoinabc.org/0.20.0/)

The features going into every protocol upgrade are planned, specified [1], and developed far in advance in order to give all Bitcoin Cash ecosystem participants ample time to prepare.
Similar to the last upgrade, the Bitcoin ABC 0.20.0 release has been made available three months in advance of the upgrade activation, which is scheduled to occur on November 15th, 2019.
The protocol upgrade, once activated, will enable the following features:
* **Schnorr signatures for OP_CHECKMULTISIG(VERIFY)** [2]. The previous upgrade enabled Schnorr signatures to be used with OP_CHECKSIG and OP_CHECKDATASIG, this upgrade extends that support to OP_CHECKMULTISIG.  After this upgrade, all signature checking operations will support Schnorr signatures.
* **Enforce MINIMALDATA in script** [3]. This removes the final BIP 62 malleability vector, and means that most of the transactions on the BCH network (including all P2PKH transactions) will now be non-malleable.

To assist technical preparations for the upgrade, a testnet is available where the upgrade features can be trialed and tested [4].
This testnet can be used to ensure compatibility, or to get started building products to make use of the upgrade features.

By implementing protocol optimizations and upgrades, we can enable peer-to-peer digital cash to scale many orders of magnitude beyond current limits.
Bitcoin Cash must continuously improve in order to compete. We at Bitcoin ABC are happy to work on building the infrastructure needed to enable Bitcoin Cash to be the best money the world has ever seen.

### Reference Links
[1] [November 2019 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md)  
[2] [Specification for Schnorr Signatures in OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md)  
[3] [Specification for Enforcing MINIMALDATA in Script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md)  
[4] [Testnet Information](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md)  
