---
layout: post
title: November hardfork changes to be completed by August 15th
subtitle: Only one week left before the code-complete date
---

Keeping inline with our proposed [November Upgrade Timeline](https://www.bitcoinabc.org/2018-07-05-nov-hardfork-timeline/), Bitcoin ABC has been striving to have consensus-related changes be in a code-complete state by August 15th. This is both a reminder to those contributing code to Bitcoin ABC and a status update to the community.  Once all changes are in on August 15th, we will be cutting a release for 0.18.0 and begin testing on testnet.

The following changes are completed and will be ready for testing on August 15th:
 * Canonical transaction ordering [1]
 * Enforcement of minimum transaction size of 100 bytes to prevent attacks on the Merkle tree [1]
 * Activation code and implementation for OP_CHECKDATASIG and OP_CHECKDATASIGVERIFY [2]
 * Make push-only mandatory for scriptSig [1]

The following changes are in progress and we expect them to be ready by August 15th:
 * Modified fee structure to allow for an order of magnitude decrease in fees for typical transactions (not strictly a consensus change, but an important change being included with the release).

### Reference Links
[1] [November Hardfork Spec](https://github.com/bitcoincashorg/bitcoincash.org/pull/94/files)  
[2] [Spec for OP_CHECKDATASIG and OP_CHECKDATASIGVERIFY](https://github.com/bitcoincashorg/bitcoincash.org/pull/93/files)  
