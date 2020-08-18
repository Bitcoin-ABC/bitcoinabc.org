---
name: signrawtransactionwithwallet
version: 0.21.12
group: wallet
permalink: doc/0.21.12/rpc/wallet/signrawtransactionwithwallet/
---

signrawtransactionwithwallet "hexstring" ( [{"txid":"hex","vout":n,"scriptPubKey":"hex","redeemScript":"hex","amount":amount},...] "sighashtype" )

Sign inputs for raw transaction (serialized, hex-encoded).
The second optional argument (may be null) is an array of previous transaction outputs that
this transaction depends on but may not yet be in the block chain.


Arguments:
1. hexstring                       (string, required) The transaction hex string
2. prevtxs                         (json array, optional) A json array of previous dependent transaction outputs
     [
       {                           (json object)
         "txid": "hex",            (string, required) The transaction id
         "vout": n,                (numeric, required) The output number
         "scriptPubKey": "hex",    (string, required) script key
         "redeemScript": "hex",    (string) (required for P2SH)
         "amount": amount,         (numeric or string, required) The amount spent
       },
       ...
     ]
3. sighashtype                     (string, optional, default=ALL|FORKID) The signature hash type. Must be one of
                                   "ALL|FORKID"
                                   "NONE|FORKID"
                                   "SINGLE|FORKID"
                                   "ALL|FORKID|ANYONECANPAY"
                                   "NONE|FORKID|ANYONECANPAY"
                                   "SINGLE|FORKID|ANYONECANPAY"

Result:
{
  "hex" : "value",          (string) The hex-encoded raw transaction with signature(s)
  "complete" : true|false,    (boolean) If the transaction has a complete set of signatures
  "errors" : [                (json array of objects) Script verification errors (if there are any)
    {
      "txid" : "hash",        (string) The hash of the referenced, previous transaction
      "vout" : n,               (numeric) The index of the output to spent and used as input
      "scriptSig" : "hex",    (string) The hex-encoded signature script
      "sequence" : n,           (numeric) Script sequence number
      "error" : "text"        (string) Verification or signing error related to the input
    }
    ,...
  ]
}

Examples:
> bitcoin-cli signrawtransactionwithwallet "myhex"
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "signrawtransactionwithwallet", "params": ["myhex"] }' -H 'content-type: text/plain;' http://127.0.0.1:8332/

