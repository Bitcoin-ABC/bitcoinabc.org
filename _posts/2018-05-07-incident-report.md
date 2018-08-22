---
layout: post
title: Bitcoin-ABC incident report (26APR2018)
subtitle: 
multiLangId: 2018-05-07-incident-report
lang: en
---

This document contains information regarding the response to a critical vulnerability applicable to miners of Bitcoin Cash using Bitcoin-ABC 0.17.0. Appropriate action has been taken to mitigate the impact of this vulnerability. This document is provided for information purposes only.

Bitcoin ABC 0.17.1 fixes this problem.

On 26APR2018 Bitcoin-ABC developers were notified by unknown person(s) of the vulnerability. If exploited the flaw would have caused an unintended split in the Bitcoin Cash network.

## Description

An attacker may construct a malicious transaction which would be accepted by Bitcoin-ABC 0.17.0 and mined into a block. This block would be rejected by all other versions of Bitcoin Cash compliant implementations. The malicious transaction would contain the bitflag of 0x20 set in the signature hash type.

## Impact

BUCash and versions of Bitcoin-ABC prior to 0.17.0 could be split from
the majority Bitcoin Cash blockchain. Only Bitcoin ABC and BUCash nodes were included in the analysis of this vulnerability.

## Mitigation

After analysis of the vulnerability and possible responses, Bitcoin-ABC developers prepared a patch for the vulnerability, and a private release, to distribute directly to mining pool operators. Due to the decentralized nature of the mining community it was not possible to reach everyone directly. This release was provided to verified Bitcoin Cash miners to forward to trusted miners once they had upgraded.

We advise any Bitcoin ABC 0.17.0 users to upgrade to the latest version as soon as possible.

## Follow-up

Bitcoin ABC will be taking several actions in order to prevent such an event from occuring again, as well as reduce the overall response time in the case of emergent issues in the future.

Additionally, Bitcoin ABC is in discussions with industry participants to establish a formal bug bounty system.

## Acknowledgement

Bitcoin ABC wants to thank the person(s) who disclosed this vulnerability responsibly. They provided a clear and professional report. If they are willing to come forward, we would like to ensure they receive a reward.

We also want to thank the miners for their cooperation, understanding and for the fast and professional way in which they took action to protect the Bitcoin Cash network and its users.
