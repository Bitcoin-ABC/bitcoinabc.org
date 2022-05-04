---
layout: post
title: eCash Avalanche Development Update
subtitle: The Road to Post Consensus
multiLangId: 2022-05-02-avalanche-dev-update
lang: en
---

![Avalanche Development Update](/img/avalanche-dev-update.jpg "Avalanche Development Update")

For the past year, and more, the Bitcoin ABC team has been working to implement the
Avalanche protocol on eCash. The website [avalanche.cash](https://www.avalanche.cash/)
was created in order to give more transparency into the work being done, show the steps
completed and give a sense of the future roadmap and milestones.

About a month ago, the roadmap items leading up to the Post-consensus milestone turned green,
and the eCash project [announced](https://twitter.com/eCashOfficial/status/1508676120224358400) 
that the Avalanche post-consensus implementation had reached Incubating status.

The purpose of this blog post is to explain what this means, and give some more information and
context on the work being done.

## What is happening during the "Incubating" period?

Incubating is a period where the Avalanche post-consensus features are feature-complete,
but still require testing and shakeout by the team.

Since the Incubating period started, Bitcoin ABC has been doing repeated rounds of testing of the
Avalanche features of the node. These tests have uncovered some issues that need to be fixed and areas
where it needs to be made more robust. While this takes additional time and work, the good news is that
the resulting Avalanche implementation is becoming more resilient against potential attacks.

Some fixes made during the Incubation period are:
- Increase outbound network connection numbers so that nodes can become more connected to the network
([D11360](https://reviews.bitcoinabc.org/D11360), [D11361](https://reviews.bitcoinabc.org/D11361)).
- Close some potential Denial of Service vectors ([11364](https://reviews.bitcoinabc.org/D11364)).
- Fix poll-only mode, so that non-staking nodes can get the information needed to poll Avalanche nodes
([D11363](https://reviews.bitcoinabc.org/D11363), [D11365](https://reviews.bitcoinabc.org/D11365)).
- Fix bootstrap heuristic calculation to account for own Proof
([D11367](https://reviews.bitcoinabc.org/D11367)).
- Actively request Proofs from a variety of nodes on the network, in particular during bootstrap. This is
needed to have good assurance that the node can bootstrap in a decentralized way, with similar trust
assumptions to current (ie, it should work as long as there is a connection to one honest node).
This is currently work in progress.

Anyone interested in more development details can have a look at Bitcoin ABC development activity
[here](https://reviews.bitcoinabc.org/feed/query/all/).

The incubating period is also a time to prepare mainnet Avalanche nodes to ensure sufficient quorum for
the launch on Mainnet. It is important to have enough nodes and staked coins. This will set up the
network for success.

## What will happen after the Incubating period?

After the Incubating phase, the Avalanche Post-Consensus will be considered live on the eCash network.
This means that there will be sufficient nodes running the protocol, with sufficient XEC staked,
for the protocol to run reliably and securely.

Additionally, a version of Bitcoin ABC node software will be released that includes the `-avalanche`
parameter as a standard node-configuration option. This means that Avalanche Post-Consensus will be ready
for anyone on the eCash network to use. It will still be off-by-default, and considered an optional
feature.

## What is Post-Consensus?

Post-Consensus is named that way because it is dealing with blocks *after* they are produced by miners.
By contrast, Pre-Consensus is when the Avalanche protocol is used by nodes to come to consensus on
transactions *before* blocks are produced.

With Avalanche Post-Consensus, nodes can come to consensus on the current live status of blocks that
are visible on the eCash network. In other words, it allows nodes to know that the blocks they see are
also accepted by the rest of the network. This information can then be used to defend the network against
block withholding attacks, and blockchain reorganization attacks.

After Pre-Consensus is implemented in Bitcoin ABC, Post-Consensus will also be used to reject blocks that
include transactions that conflict with transactions that were finalized via Pre-Consensus. This will
allow users of the eCash network to benefit from near-instant transaction finalization, with confidence
that finalized transactions cannot be reversed.

## What comes next?

In the coming weeks, more information and tutorials about how to run Avalanche Post-Consensus will be
released.

Looking farther ahead, the next milestone for Post-Consensus will be to make the protocol run
"on-by-default" in the node's configuration settings. This will be activated after sufficient monitoring
of Avalanche Post-Consensus running as an optional setting, and it has proven to be reliable and stable.

In the meantime, development of further eCash Avalanche capabilities continues. Upcoming capabilities
include Pre-Consensus for near-instant transaction finality, and staking rewards.

For more info and to monitor development progress, see [Avalanche.cash](https://www.avalanche.cash/).

## About Avalanche

Using a fast consensus protocol to do Pre-Consensus has been a long-standing item on the
[eCash Roadmap](https://e.cash/roadmap-explained) (and previously on the Bitcoin Cash roadmap).
This is one of the improvements needed to power eCash to be a competitor and alternative to
Central Bank Digital Currencies (CBDCs). When the
[Avalanche whitepaper](https://ipfs.io/ipfs/QmUy4jh5mGNZvLkjies1RWM4YuvJh5o2FYopNPVYwrRVGV)
appeared in 2018, eCash founder Amaury Séchet, and the Bitcoin ABC team, recognized that this new 
protocol was what they had been searching for, as it fulfilled the needed requirements.

It should be noted that eCash's Avalanche implementation is completely separate and distinct from the
AVAX Avalanche project. They have no connection, other than both using the protocol described in the
Avalanche whitepaper. In the case of eCash, Avalanche consensus is used for fast and live consensus needs,
such as fast transaction finality. Proof-of-work based Nakamoto consensus is retained where it is
superior, providing objective consensus criterion to enable decentralized node bootstrapping.

Adding the Avalanche protocol has been long and technically challenging work. It is an entirely
new consensus protocol which had to be implemented from scratch by the Bitcoin ABC team. While there are
still many steps remaining to realize the full benefits of the Avalanche protocol, the launch of
Post-Consensus on the eCash mainnet is a significant achievement, and a solid foundation for further
enhancements to build upon.
