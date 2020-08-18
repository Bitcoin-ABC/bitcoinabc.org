---
name: buildavalancheproof
version: 0.21.12
group: avalanche
permalink: doc/0.21.12/rpc/avalanche/buildavalancheproof/
---

buildavalancheproof sequence expiration "master" [{"txid":"hex","vout":n,"amount":amount,"height":n,"iscoinbase":bool,"privatekey":"str"},...]

Build a proof for avalanche's sybil resistance.

Arguments:
1. sequence                      (numeric, required) The proof's sequence
2. expiration                    (numeric, required) A timestamp indicating when the proof expire
3. master                        (string, required) The master public key
4. stakes                        (json array, required) The stakes to be signed and associated private keys
     [
       {                         (json object, required) A stake to be attached to this proof
         "txid": "hex",          (string, required) The transaction id
         "vout": n,              (numeric, required) The output number
         "amount": amount,       (numeric or string, required) The amount in this UTXO
         "height": n,            (numeric, required) The height at which this UTXO was mined
         "iscoinbase": bool,     (boolean, optional, default=false) Indicate wether the UTXO is a coinbase
         "privatekey": "str",    (string, required) private key in base58-encoding
       },
       ...
     ]

Result:
"poof"    (string) A string that is a serialized, hex-encoded proof data.

Examples:
> curl --user myusername --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "buildavalancheproof", "params": [0 1234567800 "<master>" []] }' -H 'content-type: text/plain;' http://127.0.0.1:8332/


