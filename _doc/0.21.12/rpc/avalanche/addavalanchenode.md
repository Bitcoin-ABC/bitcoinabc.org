---
name: addavalanchenode
version: 0.21.12
group: avalanche
permalink: doc/0.21.12/rpc/avalanche/addavalanchenode/
---

addavalanchenode nodeid "publickey" "proof"

Add a node in the set of peers to poll for avalanche.

Arguments:
1. nodeid       (numeric, required) Node to be added to avalanche.
2. publickey    (string, required) The public key of the node.
3. proof        (string, required) Proof that the node is not a sybil.

Result:
"success"    (boolean) Whether the addition succeeded or not.

Examples:
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "addavalanchenode", "params": [5, "<pubkey>", "<proof>"] }' -H 'content-type: text/plain;' http://127.0.0.1:8332/


