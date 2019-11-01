---
layout: post
title: Make sure you are ready for the Bitcoin Cash network upgrade
subtitle: Upgrade activates Nov. 15th
multiLangId: 2019-10-30-upgrade-reminder
lang: en
---

## What is happening?

In just over two weeks, on Nov 15th 2019, the Bitcoin Cash network will undergo a planned network upgrade. This upgrade is a routine scheduled process, as part of the [Bitcoin Cash Roadmap](https://www.bitcoincash.org/roadmap.html).

## What do I need to do?

All node operators will need to update their node software to a recent version. For Bitcoin ABC users, this means any version 0.20.0 or above, which can be downloaded [here](https://download.bitcoinabc.org/).

Anyone running a service such as a block explorer, an exchange, or any other service provided by a full node, needs to upgrade.

Regular users do not have to do anything. Wallets are not affected by this upgrade, and should continue to function normally.

## What happens if I don’t upgrade?

Older Bitcoin ABC versions (0.19.x) will automatically become incompatible with the rest of the Bitcoin Cash network as the upgrade activates on November 15th. Non-upgraded nodes are designed to operate in a way that will not interfere with the upgraded network, and safely separate from upgraded nodes after November 15th. This means that anyone wanting to use a node on the Bitcoin Cash network going forward needs to upgrade.

## What features are included in the upgrade?

A specification is available for the November upgrade [here](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md).

This upgrade will activate two features:
* [Schnorr signatures for OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md). The previous upgrade enabled Schnorr signatures to be used with OP_CHECKSIG and OP_CHECKDATASIG, this upgrade extends that support to OP_CHECKMULTISIG.  After this upgrade, all signature checking operations will support Schnorr signatures.
* [Enforce MINIMALDATA in script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md). This removes the final BIP 62 malleability vector, and means that most of the transactions on the BCH network (including all P2PKH transactions) will now be non-malleable.

These features allow some enhanced functionality, such as [hidden smart contracts](https://youtu.be/6V98Q4FnSY0). Regular users of Bitcoin Cash will not be affected.

## What other information is available?

To assist technical preparations for the upgrade, a [testnet](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md) is available where the upgrade features can be trialed and tested.
This testnet can be used to ensure compatibility, or to get started building products to make use of the upgrade features.

If you have any questions, or need assistance, please reach out to us by [email](mailto:info@bitcoinabc.org).
Developers may also wish to join our Bitcoin ABC development [Telegram channel](https://t.me/joinchat/HCYr50mxRWjA2uLqii-psw).
