---
name: getexcessiveblock
version: 0.21.12
group: network
permalink: doc/0.21.12/rpc/network/getexcessiveblock/
---

getexcessiveblock

Return the excessive block size.
Result:
  excessiveBlockSize (integer) block size in bytes

Examples:
> bitcoin-cli getexcessiveblock 
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getexcessiveblock", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:8332/


