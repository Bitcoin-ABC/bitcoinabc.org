---
layout: post
title: How to Upgrade your Bitcoin Cash Node with Bitcoin ABC
subtitle: Forgot to upgrade your node? Here's how to get back onto the upgraded BCH network.
multiLangId: 2020-05-15-how-to-upgrade
lang: en
---

Forgot to upgrade your node? Here's how to get back onto the upgraded BCH network:

These instructions are for those who left old versions (0.20.12 or older) of Bitcoin ABC running through the May 15th, 2020 upgrade. Follow these instructions to get back on the main network.

If you are using bitcoin-qt, follow these steps:

1. Stop your running node
2. Delete the list of nodes you have banned: `rm ~/.bitcoin/banlist.dat`
3. Download version 0.21.x from [https://download.bitcoinabc.org/latest/](https://download.bitcoinabc.org/latest/)
4. Start up the new version (`./bin/bitcoin-qt`)
5. Open Help -> Debug window
6. In the console type `reconsiderblock 00000000000000000033dfef1fc2d6a5d5520b078c55193a9bf498c5b27530f7`
7. Wait until your node is on the correct chain. This could take some time if your old node was running for a while, and other nodes banned you on the network. You can check that you are on the correct chain by typing `getblockchaininfo` and verifying the information with a public block explorer such as [https://explorer.bitcoin.com/bch](https://explorer.bitcoin.com/bch), [https://blockchair.com/bitcoin-cash](https://blockchair.com/bitcoin-cash), or [https://cash.coin.dance/](https://cash.coin.dance/).

If you are running bitcoind, follow these steps:

1. Stop your running node
2. Delete the list of nodes you have banned: `rm ~/.bitcoin/banlist.dat`
3. Download version 0.21.x from [https://download.bitcoinabc.org/latest/](https://download.bitcoinabc.org/latest/)
4. Start up the new version (`./bin/bitcoind`)
5. Use bitcoin-cli to type: `./bin/bitcoin-cli reconsiderblock 00000000000000000033dfef1fc2d6a5d5520b078c55193a9bf498c5b27530f7`
6. Wait until your node is on the correct chain. This could take some time if your old node was running for a while, and other nodes banned you on the network. You can check that you are on the correct chain by typing `./bin/bitcoin-cli getblockchaininfo` and verifying the information with a public block explorer such as [https://explorer.bitcoin.com/bch](https://explorer.bitcoin.com/bch), [https://blockchair.com/bitcoin-cash](https://blockchair.com/bitcoin-cash), or [https://cash.coin.dance/](https://cash.coin.dance/).

## Testnet

To update a testnet node, follow similar steps as above, deleting the banlist at `~/.bitcoin/testnet3/banlist.dat` and reconsider block `0000000099f5509b5f36b1926bcf82b21d936ebeadee811030dfbbb7fae915d7`
