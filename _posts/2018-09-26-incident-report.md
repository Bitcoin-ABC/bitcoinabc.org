---
layout: post
title: Bitcoin-ABC incident report (17SEPT2018)
multiLangId: 2018-09-26-incident-report
lang: en
---

Bitcoin-ABC incident report (17SEPT2018)

This document contains information regarding our response to a critical vulnerability affecting all versions of Bitcoin ABC, Bitcoin Core versions 0.14.3 to 0.16.2, and various versions of Bitcoin Core-derived code bases such as Litecoin, Dash, and others. Appropriate action has been taken to mitigate the impact of this vulnerability. This document is provided for information purposes only.

Bitcoin ABC [0.18.2](https://download.bitcoinabc.org/0.18.2/) fixes this vulnerability and all node operators are urged to upgrade as soon as possible.

On 17SEPT2018 Bitcoin ABC developers were notified anonymously of the vulnerability. If exploited, the vulnerability could have been used as a DDoS vector (via crashing the node) and/or a method for inflating the coin supply.  At the time of disclosure, Bitcoin ABC was only aware of the DDoS vector.  The coin inflation vector was discovered shortly after disclosure and fixing of the bug in Bitcoin ABC.

## Description

At the time of disclosure, a vulnerability in Bitcoin Core and Bitcoin ABC was discovered that would allow a miner to craft a block with a transaction that contains the spending of the same input multiple times.  This would trigger an assertion in block validation code, causing the node to crash.  Such a specially-crafted block could be sent to any node on the network to bring it down, enabling denial-of-service behavior.

The vulnerability was first introduced in Bitcoin Core 0.14, the details of which are provided [here](https://bitcoincore.org/en/2018/09/20/notice/). Since Bitcoin ABC began as a software fork of Bitcoin Core after the introduction of the vulnerability, ABC also contained this vulnerability.

More information on bug’s discovered has been [detailed here](https://medium.com/@awemany/600-microseconds-b70f87b0b2a6) by the original discloser.

After the vulnerability was fixed, it was discovered that the same bug could be exploited to inflate the coin supply if a miner includes a non-broadcast transaction with duplicate inputs in a block.

## Impact

The vulnerability described above was not exploited on mainnet.  This can be verified by examining all transactions on the blockchain and seeing that no transaction contains duplicate inputs.

## Mitigation

A fix was applied to the Bitcoin ABC repository, with the [commit message](https://reviews.bitcoinabc.org/D1790) kept deliberately vague in order not to draw public attention to the existence of the problem. This was done to avoid tipping off potential attackers before node operators could have a chance to upgrade to the bugfix release.

After the fix was applied, we prepared a release for version 0.18.2 and immediately made it available to various mining pool operators.  Shortly after the 0.18.2 release, Bitcoin ABC sent out public communications encouraging all node operators to upgrade.

Any node operators running Bitcoin ABC 0.18.1 or earlier are strongly encouraged to upgrade as soon as possible.

## Follow-up

Bitcoin ABC will be taking various actions to improve and streamline the responsible disclosure process that made the discovery and fixing of this bug possible.

## Acknowledgement

Bitcoin ABC would like to thank the anonymous person who disclosed the vulnerability responsibly (this person has now been self-identified as Bitcoin Unlimited developer, Awemany, through his [Medium post](https://medium.com/@awemany/600-microseconds-b70f87b0b2a6).

We would also like to thank the miners and other node operators who took immediate action in upgrading their Bitcoin ABC software.  In doing so, they have provided security and protection to the Bitcoin Cash network and its users.
