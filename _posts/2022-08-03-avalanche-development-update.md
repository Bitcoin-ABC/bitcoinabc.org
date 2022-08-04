---
layout: post
title: eCash Avalanche Development Update
subtitle: Robust Networking and Iterative Improvements
multiLangId: 2022-08-03-avalanche-dev-update
lang: en
---

![Avalanche Development Update](/img/avalanche-dev-update.jpg "Avalanche Development Update")

This article is to bring people up to date on what’s been achieved, and what's been
happening in our development activities on Avalanche for eCash, since the 
[previous update](/2022-05-02-avalanche-development-update/) from early May 2022.

The two primary advancements since the last update were:
1. Faster and more robust discovery of Proofs from the network. This was accomplished through the
implementation of a “Compact Proof Request” networking capability which allows nodes to actively request
all the Proofs that other nodes know about, and
2. Many cycles of iterative improvements via repeated rounds of testing. The details of these fixes and
improvements are expanded later in this article.

As context for understanding these developments, it may be helpful to explain how the networking requirements
for the Avalanche protocol differ from traditional Nakamoto consensus.

## Avalanche Networking

The Avalanche protocol and Nakamoto consensus are two different consensus protocols that
have different properties and tradeoffs. One of the characteristics of the Avalanche protocol
is that its security relies on the nodes being well connected to the rest of the network.
This is quite different from Nakamoto consensus, which only needs enough connectivity to be
confident that it can get the longest Proof-of-Work chain. In other words, Nakamoto consensus
only relies on being connected to at least one good node.

For Avalanche consensus, on the other hand, the node needs to be well connected to the network.
This means that the node should have connections to nodes representing the vast majority of
stake on the network. This is because the security model of Avalanche consensus involves
randomly polling nodes from the entire set of valid nodes. It can be thought of as random sampling,
with a different set of random nodes for each round of polling.

(It should be noted that the random sampling is weighted by the amount of staked coins associated
with the node. A node with twice the stake will be “sampled” twice as often, on average,
as a node with half that amount of stake.)

In the eCash Avalanche protocol, the set of stakers are represented by “Proofs”. These Proofs
contain signatures from the staked coins that delegate authority to one or more nodes on the
network, via a public key. This means that the set of valid Proofs represents the entities that
are participating in the Avalanche protocol, and we call these “Avalanche Peers”. Note that
Avalanche Peers can delegate their authority to several physical nodes. This can be done for
technical reasons: to spread the load across nodes, and for redundancy.

Because of this, we can see that it is important for the nodes to be able to reliably obtain
the full set of Avalanche Proofs.

## Compact Proof Requests

Because having a complete set of Avalanche Peers is an important security parameter for Avalanche,
a more robust method of obtaining Proofs from other nodes was needed. This is what the
“Compact Proof Request” mechanism provides.

Prior to the implementation of Compact Proof Requests, the nodes shared Proofs using a method
similar to transaction propagation. For anyone who has used 0-conf transactions, this tends to
work well enough that all nodes typically receive any transaction that’s broadcast. But it’s not
good enough for the network requirements of Avalanche, especially when considering the case of a
bootstrapping node, which needs access to Proofs that may have been originally broadcast far
earlier. The protocol needs a way to explicitly request other nodes for a list of all the Proofs
they have, and then fetch those Proofs.

[![Compact Proof Requests](/img/avalanche-roadmap-item-compact-proof-requests.jpg)](https://avalanche.cash/)

Essentially, the way the Compact Proof Requests work is they simply send the request to a node
on the network, and this node replies with a list of “short IDs” of the Proofs they have at that
time. The “short ID” part of the code is similar to the “Compact Blocks” code, and re-uses that
implementation. This is a bandwidth-efficient way to transfer the information over the network.

Another detail of this protocol that you may notice, is that it uses RCU (Read Copy Update)
pointers within a Radix Tree to keep track of the Proofs. When the responding node sends the
list of short IDs, it also takes a snapshot of the Proofs at that time. RCU pointers make this
snapshot more efficient by not actually making a copy until the original is updated (which it
often won’t be). Taking a snapshot in this way will ensure that the responding node still has
all the Proofs in the list if/when the requesting node asks for them. Since Proofs can be replaced,
or be dropped by the node for other reasons, it keeps the protocol simpler if the node can always
respond with the Proofs that are requested (rather than have other special cases, such as telling
the requesting node it doesn’t have that Proof anymore for some reason).

In summary, the Compact Proofs Requests facility is a robust and efficient way for nodes to
request Proofs from other nodes on the network.

The following is a partial list of the Diffs that implemented Compact Proof Requests:
  - [Let the radix tree work with 256 bits keys](https://reviews.bitcoinabc.org/D11405)
  - [Maintain a radix tree of the proofs](https://reviews.bitcoinabc.org/D11450)
  - [Introduce a CompactProofs class for managing the short proof ids](https://reviews.bitcoinabc.org/D11453)
  - [Answer getavaproofs message with short proof ids](https://reviews.bitcoinabc.org/D11388)
  - [Use the ProofComparator for sets and maps](https://reviews.bitcoinabc.org/D11463)
  - [Turn ProofRef into a RCUPtr](https://reviews.bitcoinabc.org/D11466)
  - [Extract proof reception logic out of the avaproof message handling](https://reviews.bitcoinabc.org/D11520)
  - [Extract the compact proofs functional test to its own file](https://reviews.bitcoinabc.org/D11533)
  - [Request missing proofs from short ids](https://reviews.bitcoinabc.org/D11545)
  - [Request compact proofs from our avalanche outbound peers](https://reviews.bitcoinabc.org/D11549)
  - [Respond to missing proof indices request](https://reviews.bitcoinabc.org/D11575)
  - [Cleanup unrequested radix tree after a timeout](https://reviews.bitcoinabc.org/D11612)

## Using Compact Proof Requests for Bootstrapping

Once the Compact Proofs Requests facility was created, the most important place it is used is
during the bootstrap phase. This is when a node isn’t yet running the Avalanche protocol,
but needs to find the state of the network to be able to start polling. The bootstrap problem
is not easy to solve. In the eCash Avalanche implementation, one of the things voted on using
Avalanche polling is the Proofs themselves. It’s important for the network to maintain a stable
quorum (set of participants), so it makes sense to use Avalanche to vote on Proofs in order to
agree on a stable set. But the startup process presents us with a chicken-and-egg problem:
We need a stable quorum to start using Avalanche, but we want to use Avalanche polling to
maintain the quorum.

A simple idea would be to simply hard-code a list of nodes to connect to to obtain the initial
state. In fact, as far as we understand, this is actually what AVAX does for its bootstrap.
But because eCash also has a Proof-of-work blockchain in addition to Avalanche, we can leverage
this to provide a good initial state for Avalanche. The node will first do the normal
Initial Block Download (IBD), and sync to the heaviest PoW chain. Then it will use
Compact Proof Requests to ask for Proofs from all the Avalanche-aware nodes it is connected to.
Then, once it has reached a good threshold of stake amount and number of connections,
it activates Avalanche.

[![Request Proofs](/img/avalanche-roadmap-item-request-proofs.jpg)](https://reviews.bitcoinabc.org/D11601)

What this all means is that the eCash Avalanche implementation is completely trustless and decentralized,
with the following security characteristics:
- It follows the heaviest Proof-of-Work chain to get the initial state, and
- Out of the several nodes it connects to, it must connect to at least one good node that will give it
the correct set of Proofs.

Note that these security assumptions are equivalent to those used in the current Nakamoto consensus.

## Testing and Iterative Improvements

In addition to the Compact Proof Request capability, there were many other improvements to the Avalanche
implementation in the last few months. These improvements were made by repeatedly testing the software,
searching for problems, and then fixing them. In this way, iterative improvements are made, and we can test
how the software works in a range of realistic scenarios, as well as unlikely “stress test” and attack scenarios.
Live testing is very valuable, as it can reveal issues that are difficult to capture with unit tests, especially
when it comes to the interaction of different parts of the system, or networking between different nodes.
Over the last several weeks, these tests were typically conducted every two or three days, with rounds of
improvements in between.

Some of the improvements made through this process are listed below. Note that the number of Diffs is too large
to list here, only the more significant ones are highlighted. For a more complete picture, feel free to check out
[commits on the Bitcoin ABC Github](https://github.com/Bitcoin-ABC/bitcoin-abc/commits/master).

- Handle dangling Proofs (When there is no node on the network associated with the Proof)
  - [Cleanup dangling proofs](https://reviews.bitcoinabc.org/D11659)
  - [Don't register known dangling proofs](https://reviews.bitcoinabc.org/D11738)
  - [Don't consider our local proof as dangling](https://reviews.bitcoinabc.org/D11745)
  - [Request more avalanche peers if we have dangling proofs](https://reviews.bitcoinabc.org/D11769)
  - [Request more node addresses upon receipt of a dangling proof](https://reviews.bitcoinabc.org/D11792)

- Bootstrapping improvements
  - [Use the number of nodes from which we've received avaproofs as a criterion for quorum readiness](https://reviews.bitcoinabc.org/D11601)
  - [Don't request compact proofs during IBD](https://reviews.bitcoinabc.org/D11661)
  - [Request addresses and proofs from our inbounds while the quorum is not established](https://reviews.bitcoinabc.org/D11707)
  - [Don't download proofs during IBD](https://reviews.bitcoinabc.org/D11816)

- Add UTXO age requirement for Proofs
  - [Enforce min UTXO age in avalanche proofs](https://reviews.bitcoinabc.org/D11622)
  - [Make the orphan pool only accept proofs that have valid but immature utxos](https://reviews.bitcoinabc.org/D11669)

- Seek network Peers and Nodes more aggressively
  - [Aggressively request compact proofs](https://reviews.bitcoinabc.org/D11666)
  - [Request more peers for their avalanche nodes](https://reviews.bitcoinabc.org/D11770)

- Improvements to poll-only mode (for nodes that don’t have their own Proof)
  - [Send a avahello message when no proof is supplied](https://reviews.bitcoinabc.org/D11723)

- Other networking improvements
  - [Don't consider our quorum valid if we don't have enough nodes connected](https://reviews.bitcoinabc.org/D11766)
  - [Don't ban a peer sending a proof with an unknown utxo](https://reviews.bitcoinabc.org/D11815)

- Logging and debugging improvements.
  - [Add count of conflicting proofs to getavalancheinfo](https://reviews.bitcoinabc.org/D11696)
  - [Add count of orphan proofs to getavalancheinfo](https://reviews.bitcoinabc.org/D11697)
  - [Get rid of the compact proof cleanup log](https://reviews.bitcoinabc.org/D11721)
  - [Add count of finalized proofs to getavalancheinfo](https://reviews.bitcoinabc.org/D11729)
  - [Fix an log error during proof rejection](https://reviews.bitcoinabc.org/D11756)
  - [Print the proofid in getavalancheoeerinfo](https://reviews.bitcoinabc.org/D11757)
  - [Improve RPC fields names and description in getavalanchepeerinfo](https://reviews.bitcoinabc.org/D11758)
  - [Add the dangling proofs count to the getavalancheinfo RPC](https://reviews.bitcoinabc.org/D11782)

- Various bug fixes, parameter tweaks, and improvements to automated testing.
  - Diffs are too numerous to list here. See [commits on the Bitcoin ABC Github](https://github.com/Bitcoin-ABC/bitcoin-abc/commits/master).

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
still many steps remaining to realize the full benefits of the Avalanche protocol, the upcoming launch of
Post-Consensus on the eCash mainnet is a significant achievement, and a solid foundation for further
enhancements to build upon.

For more info and to monitor development progress, see [Avalanche.cash](https://www.avalanche.cash/).
