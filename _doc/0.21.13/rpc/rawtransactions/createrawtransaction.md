---
name: createrawtransaction
version: 0.21.13
group: rawtransactions
permalink: doc/0.21.13/rpc/rawtransactions/createrawtransaction/
---

createrawtransaction [{"txid":"hex","vout":n,"sequence":n},...] [{"address":amount},{"data":"hex"},...] ( locktime )

Create a transaction spending the given inputs and creating new outputs.
Outputs can be addresses or data.
Returns hex-encoded raw transaction.
Note that the transaction's inputs are not signed, and
it is not stored in the wallet or transmitted to the network.

Arguments:
1. inputs                      (json array, required) A json array of json objects
     [
       {                       (json object)
         "txid": "hex",        (string, required) The transaction id
         "vout": n,            (numeric, required) The output number
         "sequence": n,        (numeric, optional, default=depends on the value of the 'locktime' argument) The sequence number
       },
       ...
     ]
2. outputs                     (json array, required) a json array with outputs (key-value pairs).
                               For compatibility reasons, a dictionary, which holds the key-value pairs directly, is also
                               accepted as second parameter.
     [
       {                       (json object)
         "address": amount,    (numeric or string, required) A key-value pair. The key (string) is the bitcoin address, the value (float or string) is the amount in BCH
       },
       {                       (json object)
         "data": "hex",        (string, required) A key-value pair. The key must be "data", the value is hex-encoded data
       },
       ...
     ]
3. locktime                    (numeric, optional, default=0) Raw locktime. Non-0 value also locktime-activates inputs

Result:
"transaction"              (string) hex string of the transaction

Examples:
> bitcoin-cli createrawtransaction "[{\"txid\":\"myid\",\"vout\":0}]" "[{\"address\":0.01}]"
> bitcoin-cli createrawtransaction "[{\"txid\":\"myid\",\"vout\":0}]" "[{\"data\":\"00010203\"}]"
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "createrawtransaction", "params": ["[{\"txid\":\"myid\",\"vout\":0}]", "[{\"address\":0.01}]"] }' -H 'content-type: text/plain;' http://127.0.0.1:8332/
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "createrawtransaction", "params": ["[{\"txid\":\"myid\",\"vout\":0}]", "[{\"data\":\"00010203\"}]"] }' -H 'content-type: text/plain;' http://127.0.0.1:8332/


