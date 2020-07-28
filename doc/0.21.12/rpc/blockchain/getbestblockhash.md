---
name: getbestblockhash
version: 0.21.12
group: blockchain
permalink: doc/0.21.12/rpc/blockchain/getbestblockhash/
---

getbestblockhash

Returns the hash of the best (tip) block in the longest blockchain.

Result:
"hex"      (string) the block hash, hex-encoded

Examples:
> bitcoin-cli getbestblockhash 
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getbestblockhash", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:8332/


