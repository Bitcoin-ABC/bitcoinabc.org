---
layout: post
title: eCash Avalanche Mainnet Launch
subtitle: Post-Consensus to go live on Mainnet on September 14th 2022
multiLangId: 2022-08-28-avalanche-post-consensus-launch
lang: en
---

![Avalanche Post-Consensus Mainnet Launch](/img/avalanche-post-consensus-mainnet-launch.jpg "Avalanche Post-Consensus Mainnet Launch")

Avalanche Post-Consensus will go live on the [eCash](https://e.cash) Mainnet on Sept 14th. This was [announced](https://twitter.com/eCashOfficial/status/1563813874775851009) by Amaury Séchet, founder of the eCash project, at the [Electronic Cash Conference](https://2022.be.cash) in Prague.

The launch of Avalanche Post-Consensus on the eCash Mainnet is a significant achievement. Post-Consensus brings 51% attack prevention which increases security of the network significantly, bringing it on par with leading Proof-of-Work chains. It also brings 1-block finality to eCash, which opens the door for exchanges to enable 1 confirmation deposits.

Avalanche Post-Consensus also sets a solid foundation for further enhancements to eCash, such as Pre-Consensus which is currently being developed. Future work will continue to improve the properties of eCash as global electronic cash.

When the [launch countdown timer](https://avalanche.cash/) reaches 0, the status of the eCash Avalanche implementation will
change from "Incubating" to "Live". This milestone was achieved via long and technically challenging work.

## What does "Incubating" mean?

Incubating is a period where the Avalanche Post-Consensus features are feature-complete,
but still require testing and shakeout by the team. Several rounds of live testing by the
Bitcoin ABC team resulted in several fixes and improvements to the Avalanche Post-Consensus implementation.
For more details on the improvements made during the Incubation period, see our Avalanche Development Updates
[here](/2022-05-02-avalanche-development-update) and [here](/2022-08-03-avalanche-development-update).

The Incubating period is also a time to prepare Avalanche nodes to ensure sufficient
quorum for the launch on Mainnet. It is important to have enough nodes and staked coins.
This will set up the network for success.

## What will happen when the countdown reaches 0?

At the end of the countdown, Avalanche Post-Consensus will be considered live on the eCash network.
This means that there will be sufficient nodes running the protocol, with sufficient XEC staked,
for the protocol to run reliably and securely.

Additionally, Bitcoin ABC 0.26.0 will be released. This release will include the `-avalanche` parameter
as a standard node-configuration option. This means that Avalanche Post-Consensus will be ready for anyone
on the eCash network to use. It will still be off-by-default, and considered an optional feature.

## What is Post-Consensus?

Post-Consensus is named that way because it is dealing with blocks *after* they are produced by miners.
By contrast, pre-consensus is when the Avalanche protocol is used by nodes to come to consensus on
transactions *before* blocks are produced.

With Avalanche Post-Consensus, nodes can come to consensus on the current status of blocks that
are visible on the eCash network. In other words, it allows nodes to know that the blocks they see are
also accepted by the rest of the network. This information can then be used to defend the network against
block withholding attacks, and blockchain reorganization attacks.

After Pre-Consensus is implemented in Bitcoin ABC, Post-Consensus will also be used to reject blocks that
include transactions that conflict with transactions that were finalized via Pre-Consensus. This will
allow users of the eCash network to benefit from near-instant transaction finalization, with confidence that
finalized transactions cannot be reversed.

## What comes next?

In the coming days, more information and tutorials about how to stake your coins and run Avalanche
Post-Consensus will be released.

Looking farther ahead, the next milestone for Post-Consensus will be to make the protocol run "on-by-default"
in the node's configuration settings. This will be activated after sufficient monitoring of Avalanche
Post-Consensus running as an optional setting, and it has proven to be reliable and stable.

In the meantime, development of further eCash Avalanche capabilities continues. Upcoming capabilities include
Pre-Consensus for near-instant transaction finality, and staking rewards to incentivize the provision of Avalanche
node services on the network.

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
