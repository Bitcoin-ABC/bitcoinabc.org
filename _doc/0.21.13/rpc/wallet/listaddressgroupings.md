---
name: listaddressgroupings
version: 0.21.13
group: wallet
permalink: doc/0.21.13/rpc/wallet/listaddressgroupings/
---

listaddressgroupings

Lists groups of addresses which have had their common ownership
made public by common use as inputs or as the resulting change
in past transactions

Result:
[
  [
    [
      "address",            (string) The bitcoin address
      amount,                 (numeric) The amount in BCH
      "label"               (string, optional) The label
    ]
    ,...
  ]
  ,...
]

Examples:
> bitcoin-cli listaddressgroupings 
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "listaddressgroupings", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:8332/


