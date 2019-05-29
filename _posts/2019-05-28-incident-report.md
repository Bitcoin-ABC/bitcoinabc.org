---
layout: post
title: Bitcoin ABC Incident Report (15MAY2019)
multiLangId: 2019-05-28-incident-report
lang: en
---

This document contains information regarding our response to a critical vulnerability affecting mining in Bitcoin ABC 0.18.x (all versions) and 0.19.0 through 0.19.5. Appropriate action has been taken to mitigate the impact of this vulnerability. This document is provided for information purposes only.

Bitcoin ABC [0.19.6](https://download.bitcoinabc.org/0.19.6/) fixes this vulnerability and operators of mining nodes are urged to upgrade as soon as possible.

On 15MAY2019 Bitcoin ABC developers became aware of zero-day vulnerability being exploited on the Bitcoin Cash mainnet that began preventing miners running Bitcoin ABC software from constructing non-empty blocks.  The exploit introduced a set of transactions that passed various mempool acceptance checks, but would collectively fail checks in the getblocktemplate RPC and prevent these transactions and others from being mined.  The vulnerability was not disclosed to Bitcoin ABC developers prior to the incident.

## Description

Transaction scripts are involved in a process of heuristically estimating the computation complexity of running said script.  This process is known as sigops (signature operations) counting.  While the exact details of sigops counting is out of scope of this document due to their complexity, it became clear that sigops were not being properly counted in mempool acceptance code for transactions containing the OP_CHECKDATASIG opcode.

The exploit transactions were specially crafted to take advantage of this defect to produce transactions that would be accepted into the mempool, but fail checks in getblocktemplate.  The prime difference between mempool acceptance and block construction is a sigops limit not only per-transaction, but also a separate block-level sigops limit.  This failed check at block construction would produce an error and prevent further mining containing these specially crafted transactions.

The vulnerability was first introduced in Bitcoin ABC 0.18.0, and has been fixed in 0.19.6.

## Impact

The vulnerability described above was exploited on mainnet for approximately two hours until a fix was put into place.  During that time, miners running Bitcoin ABC software were prevented from producing blocks containing transactions other than the coinbase.  As a result, no non-coinbase transactions were confirmed during this time period.

Non-mining business operators were not directly affected by the exploit.  Users and businesses could still add transactions to the mempool, making 0-conf not affected during this event.  However, confirmations could not be made, potentially slowing commerce during this time period.

During and related to this event, there was no risk to user funds.

## Mitigation

A fix was applied to the Bitcoin ABC repository ([https://reviews.bitcoinabc.org/D3053](https://reviews.bitcoinabc.org/D3053)).

After the fix was applied, we prepared a release for version 0.19.6 and immediately made it available to various mining pool operators. Shortly after the 0.19.6 release, Bitcoin ABC sent out public communications encouraging remaining mining node operators to upgrade.

## Follow-up

Since the above fix, additional efforts have and continue to be applied to improve testing to prevent similar issues in the future.

## Acknowledgement

Bitcoin ABC would like to thank the miners who took immediate action in upgrading their Bitcoin ABC software.  In doing so, they have significantly reduced the period of time that Bitcoin Cash users could have been affected by the incident.
