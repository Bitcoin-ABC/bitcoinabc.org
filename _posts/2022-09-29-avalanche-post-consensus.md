---
layout: post
title: Avalanche Post-Consensus on eCash
subtitle: Benefits for Miners, Exchanges, and Everyday People.
multiLangId: 2022-09-29-avalanche-post-consensus
lang: en
---

![Avalanche Live on Mainnet](/img/avalanche-live.jpg)

Avalanche is here.

On September 14th 2022, the [eCash](https://e.cash) network was upgraded to support the finalization of blocks
using Avalanche Post-Consensus.

The launch of Avalanche Post-Consensus on the eCash Mainnet is a significant achievement, bringing tangible
benefits for eCash miners, exchanges, and everyday users.

As of the writing of this article, over 80 Billion XEC has been staked to run voting Avalanche nodes and support
the eCash network. For live Avalanche network statistics and to track the development of upcoming milestones,
see [avalanche.cash](https://avalanche.cash/).

## Benefits for Miners

Avalanche Post-Consensus brings 51% attack prevention to eCash. This is particularly important for miners.
Because eCash is a minority chain sharing the same SHA256 mining algorithm as Bitcoin (BTC), it is more
vulnerable to a malicious non-economically motivated attacker, who could attempt a blockchain reorganization.
Though the network as a whole can recover from such an attack, it would be particularly disruptive to miners,
who could lose blocks, costing them money.

Avalanche Post-Consensus solves this problem. Nodes come to consensus to "finalize" the blocks that they see
on the network. In other words, it allows nodes to know that the blocks they see are also seen and accepted by
the rest of the network.  If conflicting blocks appear later, the Avalanche-using miners will come to consensus
and ignore the late-appearing blocks. In this way, they defend the network against block withholding attacks,
and blockchain reorganizations.

## Benefits for Exchanges

Avalanche Post-Consensus also brings significant benefit for exchanges by bringing 1-block finality to eCash.
This enables 1-confirmation deposits.

It is very important for exchanges to ensure that deposits are secure before they allow trading and withdrawal.
This is typically done by requiring that deposit transactions have a certain number of blockchain confirmations
before the funds can be traded.

With Avalanche Post-Consensus, there is now a secure way to verify customer deposits, using the Avalanche
finalization status instead of “number of confirmations”. This will also cause deposits to be finalized with only
1 block confirmation. This will enhance exchange security by preventing re-org attacks and increase customer
satisfaction by reducing deposit confirmation times. It will also enable easier arbitrage for traders,
driving more volume and liquidity to the exchange. Happier customers are good for exchanges.

To start benefitting from Post-Consensus, exchanges should set up their eCash node to run Avalanche, and use the
new `isfinaltransaction` RPC command to check whether deposits have been finalized or not. The `isfinaltransaction`
RPC is forwards-compatible with future Avalanche upgrades.

## Benefits for Users

In its current state, eCash already offers a cash-like experience for peer-to-peer transfers. For users sending
XEC directly using a wallet such as [Cashtab](https://cashtab.com/), payments typically show up in a matter of
seconds, with sub-cent fees.

What users can expect from the Avalanche Post-Consensus is that the cash-like experience will improve further
as exchanges and other eCash services take advantage of the re-org protection and 1-block finality offered
by Avalanche Post-Consensus. This will enable services to offer a faster and more cash-like payment experience.

Looking further into the future, the eCash experience should continue to improve even more with Pre-Consensus
and other technologies in the pipeline. The purpose of all of these developments is to pursue eCash's goal
of being the most usable, secure and scalable form of electronic cash possible.

## Running Avalanche on eCash

eCash node operators can activate Avalanche by upgrading to Bitcoin ABC 0.26.2 or higher, and setting the
`avalanche=1` parameter in their `bitcoin.conf` file. This will activate Avalanche in "poll only" mode, which 
means the node can query the network to find the finalization staus of blocks, but does not contribute to the
Avalanche consensus.

Node operators who wish to contribute to the eCash network by participating in Avalanche can set up a staking node
by following our written [Avalanche Staking Tutorial](/2022-09-07-avalanche-staking-tutorial/), and the
[Stake Proof video guide](https://youtu.be/3k5M4k8OF-I).

One of the characteristics of the Avalanche protocol is that its security relies on the nodes being well connected
to the rest of the network. This means that it's important, especially for staking nodes, to have a reliable
internet connection, and to accept inbound connections. If you have a firewall, make sure to open port 8333.
Also ensure that the `maxconnections` parameter is not set in your bitcoin.conf file.

For large stakers, it's also a good idea to run more than one node for each Proof. A good option is to use remotely
hosted servers. We have created a video guide to help users [set up an eCash Avalanche node using a Virtual Private Server](https://youtu.be/ls88OH3eGwQ). 

## About Post-Consensus

Post-Consensus is named that way because it is dealing with blocks *after* they are produced by miners.
By contrast, Pre-Consensus (not yet implemented) is when the Avalanche protocol is used by nodes to come
to consensus on transactions *before* blocks are produced.

With Avalanche Post-Consensus, nodes can come to consensus on the current live status of blocks that
are visible on the eCash network. In other words, it allows nodes to know that the blocks they see are
also accepted by the rest of the network. This information can then be used to defend the network against
block withholding attacks, and blockchain reorganization attacks.

After Pre-Consensus is implemented in Bitcoin ABC, Post-Consensus will also be used to reject blocks that
include transactions that conflict with transactions that were finalized via Pre-Consensus. This will
allow users of the eCash network to benefit from near-instant transaction finalization, with confidence that
finalized transactions cannot be reversed.

## About Avalanche

Using a fast consensus protocol to do Pre-Consensus has been a long-standing item on the
[eCash Roadmap](https://e.cash/roadmap-explained) (and previously on the Bitcoin Cash roadmap).
This is one of the improvements needed to power eCash to be a competitor and alternative to
Central Bank Digital Currencies (CBDCs). When the [Avalanche whitepaper](https://ipfs.io/ipfs/QmUy4jh5mGNZvLkjies1RWM4YuvJh5o2FYopNPVYwrRVGV)
appeared in 2018, eCash founder Amaury Séchet and the Bitcoin ABC team recognized that this new 
protocol was what they had been searching for, as it fulfilled the needed requirements.

It should be noted that eCash's Avalanche implementation is completely separate and distinct from the
AVAX Avalanche project. They have no connection, other than both using the protocol described in the
Avalanche whitepaper. Avalanche on eCash is an entirely new implementation which had to be developed
from scratch by the Bitcoin ABC team.

In the case of eCash, Avalanche consensus is used for fast and live consensus needs, such as fast
transaction finality. Proof-of-work based Nakamoto consensus is retained where it is superior,
providing objective consensus criterion to enable decentralized node bootstrapping.

For more info and to monitor development progress, see [Avalanche.cash](https://www.avalanche.cash/)
