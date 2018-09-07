---
layout: post
title: Sharding Bitcoin Cash
subtitle: Article by Shammah Chancellor, Bitcoin ABC Developer
multiLangId: 2018-09-06-sharding-bitcoin-cash
lang: en
---

Moore’s law is often applied to Bitcoin as an argument for how Bitcoin can be scaled along with increased future usage. Indeed Moore’s law as it pertains to number of transistors meets this criterion. However, it is of note that clock speeds of a single core have not increased — this is due to physical limitations. Instead, CPU manufacturers have increased the number of cores for parallel processing.

This means that in order for Bitcoin to scale with Moore’s law, block construction and validation must make use of additional CPU cores. In order to make use of additional cores effectively, the data which they use must be process localized. This process of organizing data for local processing is called sharding.

However, Bitcoin currently employs data structures for computing the Merkle root of the block header which prevent data from being localized. By changing the ordering of the Merkle root computation via a canonicalization, the data may be sharded. This new Merkle root would be calculated as follows, for a block with 4 transactions that are in lexicographical order by hash (where TX_A HASH < TX_B HASH and so on, from left to right). It’s important to note that this reordering of the Merkle root still allows Merkle proofs with equal security to the original ordering.

![Visualization of Merkle/Merklix root calculation](/img/merklix-root-calculation.png "Figure 1. Visualization of Merkle/Merklix root calculation")

If we can sort the transactions into ranges over the canonical ordering of transactions, we can calculate hash of subtree B and subtree C using two independent processes. The results of these computations can be returned to an aggregator to produce subtree A. This in turn can be combined with the coinbase hash to produce a valid Merkle root for a block template.

Currently, the Merkle root for a block must be computed from a list of transactions maintained in topological order (spending transactions come after spent transactions). However, shards must maintain data based on consistent ranges. Due to the mismatch between the possible locality of data, in a sharded system, and the set of data upon which the subtree hash must be calculated, the individual shards are unable to pre-compute subtree hashes without significant synchronization. In order to solve this problem, the Merkle tree must be organized so that it is computed as an aggregate of subtree hashes which can be calculated by an individual shard.

Another useful property of canonicalizing transaction order by hash is that mempool acceptance can also be sharded across multiple processes. This can be done by placing multiple transaction “routers” in front of multiple mempool processors.

![potential parallel mempool acceptance architecture](/img/parallel-mempool-acceptance.png "Figure 2. Illustrative example of a potential parallel mempool acceptance architecture")

In this architecture, Router 1 and Router 2 can send transactions, within the same range, to previously agreed upon mempool acceptors. Using a similar method, mempool acceptors can query each other, and the UTXO database, to ensure that parent transactions exist and are spendable.

With the mempool sharded across multiple processes, either API request processor can query for hashes of various Merkle subtrees. From Figure (1) we could request Subtree B, and Subtree C. Subsequently, we can then continue to aggregate them into the Merkle root.

In order to build a node with the above architecture, the proper data structures must first be in place in the blockchain. The software cannot be easily written to take advantage of sharding prior to the data structures for sharding being used for computing the Merkle root. Canonical transaction ordering should precede the creation of any such software.

This is the reason ABC is advocating for these changes today. We must be ready for future demand, and that means we need to start working now on a node which can handle extremely large blocks — this is not an easy task and will take years to complete.

Some people have asked that ABC produce performance benchmarks of how this optimization could work. As stated above, no such benchmarks can be produced since the software must first exist. As this will take multiple years, benchmarks cannot be done on it — real engineering must be done in advance to plan for it. A summary of that engineering work is manifested above.

In order to support a smooth protocol upgrade, the current version must be able to produce and validate both types of blocks — the result is slower block template production and some minor impact on validation. In fact, the current version of Bitcoin-ABC v0.18.0 will be slightly slower in creating block templates due to the need to re-sort transactions after the initial topological sorting. This is intentional, and will be addressed when the code can be refactored after CTO, and eventually Merklix Trees, are able to be activated.

Sharding is not optional for Bitcoin Cash if we want it to scale with Moore’s law. Individual CPUs will not be getting significantly faster. Specialized hardware cannot solve this issue alone. The protocol must facilitate node software that is capable of being scaled horizontally, because vertical scaling will not work beyond blocks of roughly 1GB in size. This change is for Bitcoin, layer 1, so that miners can collect fees at global scale. Bitcoin incentives must and will be maintained.
