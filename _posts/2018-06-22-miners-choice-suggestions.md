---
layout: post
title: Bitcoin ABC's Suggestions for Adopters of "Miner's Choice"
subtitle: Doing your part in the ecosystem
---

A few weeks ago, CoinGeek and nChain announced [Miner's Choice](https://coingeek.com/coingeek-nchain-announce-miners-choice-initiative-bitcoin-cash-transaction-fees-values/).  

Initially, ABC’s response to this was one of grave concern, stemming from technical limitations with popular node software.  We discussed these concerns with miners, businesses, and other developers.  Concern was widespread, but so too was confusion as to precisely how these changes would affect the Bitcoin ecosystem.  

In an attempt to both dispel that confusion and provide guidance to stakeholders (miners, exchanges, other businesses, etc.) wishing to adopt Miner's Choice, we drafted some high-level requirements. What you see here in this document are the results of that collaboration.  Should any stakeholder wish to adopt Miner's Choice, we hope they will not only take these requirements seriously, but that they will work closely with node developers from all implementatios to make these changes happen.  

High-level requirements for Miner's Choice to be a realistic goal while keeping the Bitcoin ecosystem robust:
1. Miners: The UTXO set must not be allowed to grow faster than node software can handle [1].  Potential solutions to this may include:
 * 0-fee transactions and small value utxos may be strictly limited by number in any given block. [2]
 * Coin age of inputs may be used to select 0-fee transactions or transactions with low value utxos.
 * Transactions may have a restricted output-to-input ratio, only accepting transactions that do not drastically bloat the utxo set.
2. Exchanges and other businesses with large stakes in Bitcoin running economic nodes must diligently watch for double-spends of transactions differing by fee.  Note that these suggestions merely improve the security of your business, but cannot guarantee specific outcomes.
 * More info on how this can be abused: [0-conf double-spends on BCH](https://jasonc.me/blog/bitcoin-bip-133-double-spends-bch)
 * Economic nodes should be configured with fee filter set to 0 so that all potential transactions can be seen, or else you open your business up to differing-fee double-spend attacks.  For ABC specifically, we have a [task](https://reviews.bitcoinabc.org/T359) open to remove it.  Pull requests are welcome.
 * Ideally, we'd recommend to run multiple node implementations for redundancy, but seeing as most existing nodes have very similar codebases, the gains will be slim at this point in time.  We suggest encouraging development of node software that does not share a forked codebase with Bitcoin Core.

[1] If 0-fee transactions and small-value utxos are allowed on the network without any of these improvements, a UTXO attack on the network could double the UTXO set size for as little as $23,000 (~25 BCH), which is 93% cheaper than the cost to do so today.  

[2] Reduced number of 0-fee/small-value transactions is not sufficient on its own.  Even if 1% of 32MB blocks were consisting of free transactions, it would only take about 1.5 month’s worth of blocks to double the utxo set size for free.
