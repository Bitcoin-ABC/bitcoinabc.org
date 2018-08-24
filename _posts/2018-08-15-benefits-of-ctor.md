---
layout: post
title: Benefits of Canonical Transaction Order
multiLangId: 2018-08-15-benefits-of-ctor
lang: en
---

Jonathan Toomim wrote a wonderful article explaining several considerations involved in the decision behind Canonical Transaction Ordering (CTOR) [1]. Below is a quick summary of the points he made and why CTOR is valuable. We’ve also provided Joannes Vermorel’s article on transaction ordering as a reference [2].

Due to the way Bitcoin Cash transactions are created and hashed, a directed-acyclic graph is formed, where child transactions spend the outputs of parent transactions.  Despite the fact that a topological ordering (TTOR; this is the current mode of the Bitcoin Cash transaction ordering in a block) of the transactions in a block is always possible, it is neither the most efficient, nor the most elegant way to order transactions.  As such, moving from TTOR to CTOR provides the following benefits:

1. CTOR is simpler to implement than TTOR. Most of the complexity of TTOR comes from the requirement of ordering parent transactions before children.
2. Miners no longer need to discover a valid ordering.  About 70% of block template creation time appears to come from the child-pays-for-parent code due to ordering requirements.  Eliminating this will improve performance.
3. No need to worry about intermediate states during block validation.  This ensures that block validation can be perfectly parallel [3].  Ethereum’s scalability suffers from having a large number of intermediate states, for example.
4. It makes encoding and transmitting blocks a lot easier by allowing nodes to communicate only the transactions that differ between their mempools and a recently published block.  This is what Graphene [4] does, and it works very efficiently with CTOR.
5. CTOR reduces system complexity, eliminating the entire class of attack vectors where a malicious miner can publish a large block with a transaction ordering that is as slow to validate as possible.

Given the above, the Bitcoin ABC team believes that CTOR is superior to TTOR and worth implementing. Reducing complexity now will have huge payoffs for the future of Bitcoin Cash.

[1] [Jonathan Toomin. Canonical block order, or: How I learned to stop worrying and love the DAG](https://medium.com/@j_73307/canonical-block-order-or-dbe3ac48bcd3)

[2] [Joannes Vermorel, et al. Canonical Transaction Ordering for Bitcoin](http://blog.vermorel.com/journal/2018/6/12/canonical-transaction-ordering-for-bitcoin.html)

[3] [Wikipedia.  Embarrassingly parallel](https://en.wikipedia.org/wiki/Embarrassingly_parallel)

[4] [A. Pinar Ozisik, et al. Graphene: A New Protocol for Block Propagation Using Set Reconciliation](http://forensics.cs.umass.edu/graphene/graphene-short.pdf)
