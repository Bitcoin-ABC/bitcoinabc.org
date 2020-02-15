---
layout: post
title: Prepare for the Bitcoin Cash upgrade with Bitcoin ABC 0.21.0
subtitle: May 15th 2020 protocol upgrade is locked in
multiLangId: 2020-02-18-bitcoin-abc-0-21-0
lang: en
---

Every six months, Bitcoin Cash takes one step closer to realizing its [roadmap](https://www.bitcoincash.org/roadmap.html) of global peer-to-peer electronic cash.  With this coming network upgrade, Bitcoin ABC has prepared its 0.21.0 release. This release is compatible with the network upgrade and can be downloaded at: [https://download.bitcoinabc.org/0.21.0/](https://download.bitcoinabc.org/0.21.0/)

Similar to the [last upgrade](/2019-08-21-bitcoin-abc-0.20.0/), the Bitcoin ABC 0.21.0 release has been made available three months in advance of the upgrade activation, which is scheduled to occur on May 15th, 2020. The release and a specification [1] are prepared well in advance of the upgrade to give all network participants ample time to update. The protocol upgrade, once activated, will enable the following features:
 * Increased transaction chain limit from 25 to 50. [1]
 * OP_REVERSEBYTES opcode support in script. [2]
 * Improved counting of signature operations using the new “SigChecks” method. [3]
 * Support for a miner-activated infrastructure funding plan. [4]

By implementing protocol optimizations and upgrades, we can enable peer-to-peer digital cash to scale many orders of magnitude beyond current limits.  Bitcoin Cash must continuously improve in order to compete in this highly competitive industry. We at Bitcoin ABC are happy to work on building the infrastructure needed to enable Bitcoin Cash to be the best money the world has ever seen.

### Reference Links
[1] [Draft May 2020 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/pull/444)  
[2] [Draft Specification for OP_REVERSEBYTES](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2020-05-15-op_reversebytes.md)  
[3] [Draft Specification for SigChecks](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2020-05-15-sigchecks.md)  
[4] [Miner Infrastructure Funding Plan](/2020-02-15-miner-fund/)  
