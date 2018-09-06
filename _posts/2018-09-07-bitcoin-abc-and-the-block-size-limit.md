---
layout: post
title: Bitcoin ABC and the Block Size Limit
subtitle: Enabling larger blocks by doing the necessary technical work
multiLangId: 2018-09-07-bitcoin-abc-and-the-block-size-limit
lang: en
---

The purpose of this document is to describe the technical improvements being worked on to increase the maximum block size for Bitcoin Cash. It is part of a series of articles intended to provide more information on the work of Bitcoin ABC.

## Our Approach to Scaling

As the first software to implement Bitcoin Cash, on-chain scaling is Bitcoin ABC’s raison d’être. Bitcoin ABC is committed to increasing the block size limit for Bitcoin Cash. But on-chain scaling involves more than simply changing one number in the software. There are various technical improvements and optimizations that must be carried out so that the system can handle larger blocks safely and efficiently.

We have a simple two-pronged approach to scaling:

1. Remove immediate implementation bottlenecks to increasing the block size limit.
2. Lay the technical groundwork for massive future on-chain scaling.

Bitcoin ABC stands for “Adjustable Blocksize Cap”, and as the name implies, it is easy for any node operator to adjust their block size limit. We are in favor of raising and eventually removing the block size limit. The miners who use our software, however, want an implementation that will work well for the blocks they produce and accept. This means that the best way we can help raise the block size limit that miners choose is by removing software bottlenecks.

We have been working hard to remove the technical limitations that existed up to this point, and we will continue working to remove those that remain. The following sections list some of the work that has been done, and some tasks that lie ahead.

## Already done

### Quadratic hashing for large transactions

The method used to hash transaction data for signing (used in OP_CHECKSIG family of Op Codes) required hashing different data for each input. Since the amount of data needing to be hashed also increases linearly with transaction size, this meant that the total time spent hashing would grow quadratically for transactions with many inputs. This problem became significant for transaction sizes around 1 MB. The problem was solved permanently in Bitcoin Cash as part of the BIP-143 derived replay protected signature hashing algorithm [[1]](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/replay-protected-sighash.md).

### Compact Block Index

Compact Blocks indexes relied on 16-bit integers throughout the code, which does not work when there are more than 65536 transactions in a block. In theory, the limit could be hit with a ~4 MB block (a block of all 1-input OP_TRUE transactions), in practice it would be a problem for >8 MB. This limitation has been fixed in Bitcoin ABC and Bitcoin XT by changing the indexes to 32-bit integers [[2]](https://reviews.bitcoinabc.org/D1146), [[3]](https://github.com/bitcoinxt/bitcoinxt/pull/345).

### P2P Protocol Network Message size
The Peer-to-peer communication protocol between nodes used to limit messages sizes to 32 MB. This meant that as blocks approached and exceeded 32 MB in size, they could not be communicated between nodes. This limitation was removed with Bitcoin ABC 0.17.0 [[4]](https://reviews.bitcoinabc.org/D1133). It had also been previously removed in Bitcoin Unlimited [[5]](https://github.com/BitcoinUnlimited/BitcoinUnlimited/commit/7e65d18b99042c066401b24b99abc6e33915ba2c#diff-cd92d63baa290a195308bcb16b9105b5R19).

### RPC Interface

A limit on message size prevented block candidates greater than 16MB to be submitted via RPC. This bottleneck was removed in Bitcoin ABC 0.17.1 [[6]](https://github.com/Bitcoin-ABC/bitcoin-abc/blob/master/doc/release-notes/release-notes-0.17.1.md), [[7]](https://reviews.bitcoinabc.org/D1285).

## Next Steps

### Mining RPC

The interfaces used by miners (getblocktemplate and Stratum) are inefficient and unwieldy. One of the major shortcomings is that they make it difficult to deal with large blocks. These difficulties are noticeable below the current 32MB limit, and will become increasingly pronounced beyond it.

There is much work taking place in this area, with many different projects and proposals [[8]](https://github.com/cpacia/spec/blob/gbt/getblocktemplate2.md), [[9]](https://github.com/TheBlueMatt/bips/blob/master/bip-XXXX.mediawiki#BLOCK_TEMPLATE), [[10]](https://github.com/BitcoinUnlimited/BitcoinUnlimited/blob/dev/doc/miner.md#getminingcandidate-and-submitminingsolution). Bitcoin ABC is currently working on refactoring RPC system in order to allow dependency passing. This is in preparation for the implementation of a block template manager that does not rely on global variables. This will enable the implementation of mining interfaces that are capable of efficiently handling much larger blocks than is currently possible. Part of this process will also involves working with miners and mining pools to migrate to an upgraded protocol.

### Mempool admission logic

Due to a single threaded lock in the mempool acceptance code, mempool acceptance starts to have difficulty keeping up at around 100 transactions per second (equivalent to ~32MB blocks). This effect was identified and studied by Bitcoin Unlimited in their Gigablock Testnet project [[11]](https://youtu.be/5SJm2ep3X_M?t=5m). It is important to remove this limitation by parallelizing the mempool admission code.

## Longer-term steps

While it is important to remove bottlenecks as we encounter them, we must also lay the groundwork for massive scaling further into the future. The first step in this is building highly scalable data structures. These changes are fairly simple and well understood, and include Canonical Transaction Order [[12]](https://www.bitcoinabc.org/2018-08-27-sharding-bitcoin-cash/). The basic design of Bitcoin Cash is well suited to massive scaling, and only needs some small improvements. Once these data structures are in place, software can be improved to take advantage of parallelization at all levels. This will be a long-term project, so it is important to get the data structures in place now to enable that work to begin.

## Conclusion

Bitcoin ABC is committed to enabling increases in the block size limit by making the software capable of handling larger blocks, now and far into the future.

The best way to accomplish this goal is not to symbolically change a number, but to continue the work of building the technical capabilities for massive on-chain scaling.

## References

[1] [Replay Protected Sighash which solves quadratic hashing](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/replay-protected-sighash.md)

[2] [Compact Block Index fix in Bitcoin ABC](https://reviews.bitcoinabc.org/D1146)

[3] [Compact Block Index fix in Bitcoin XT](https://github.com/bitcoinxt/bitcoinxt/pull/345)

[4] [P2P Protocol limit removal in Bitcoin ABC](https://reviews.bitcoinabc.org/D1133)

[5] [P2P Protocol limit removal in Bitcoin Unlimited](https://github.com/BitcoinUnlimited/BitcoinUnlimited/commit/7e65d18b99042c066401b24b99abc6e33915ba2c#diff-cd92d63baa290a195308bcb16b9105b5R19)

[6] [Bitcoin 0.17.1 release notes](https://github.com/Bitcoin-ABC/bitcoin-abc/blob/master/doc/release-notes/release-notes-0.17.1.md)

[7] [Code change removing the RPC message limit in Bitcoin ABC](https://reviews.bitcoinabc.org/D1285)

[8] [Chris Pacia’s getblocktemplate2 proposal](https://github.com/cpacia/spec/blob/gbt/getblocktemplate2.md)

[9] [Matt Corallo’s BetterHash Mining Protocol proposal](https://github.com/TheBlueMatt/bips/blob/master/bip-XXXX.mediawiki#BLOCK_TEMPLATE)

[10] [Bitcoin Unlimited’s getminingcandidate and submitminingsolution RPC functions](https://github.com/BitcoinUnlimited/BitcoinUnlimited/blob/dev/doc/miner.md#getminingcandidate-and-submitminingsolution)

[11] [Bitcoin Unlimited Gigablock presentation](https://youtu.be/5SJm2ep3X_M?t=5m)

[12] [Shammah Chancellor article “Sharding Bitcoin Cash”](https://www.bitcoinabc.org/2018-08-27-sharding-bitcoin-cash/)
