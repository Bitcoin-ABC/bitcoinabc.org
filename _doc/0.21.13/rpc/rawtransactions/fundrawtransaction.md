---
name: fundrawtransaction
version: 0.21.13
group: rawtransactions
permalink: doc/0.21.13/rpc/rawtransactions/fundrawtransaction/
---

fundrawtransaction "hexstring" ( options )

Add inputs to a transaction until it has enough in value to meet its out value.
This will not modify existing inputs, and will add at most one change output to the outputs.
No existing outputs will be modified unless "subtractFeeFromOutputs" is specified.
Note that inputs which were signed may need to be resigned after completion since in/outputs have been added.
The inputs added will not be signed, use signrawtransactionwithkey or signrawtransactionwithwallet for that.
Note that all existing inputs must have their previous output transaction be in the wallet.
Note that all inputs selected must be of standard form and P2SH scripts must be
in the wallet using importaddress or addmultisigaddress (to calculate fees).
You can see whether this is the case by checking the "solvable" field in the listunspent output.
Only pay-to-pubkey, multisig, and P2SH versions thereof are currently supported for watch-only

Arguments:
1. hexstring                          (string, required) The hex string of the raw transaction
2. options                            (json object, optional) for backward compatibility: passing in a true instead of an object will result in {"includeWatching":true}
     {
       "changeAddress": "str",        (string, optional, default=pool address) The bitcoin address to receive the change
       "changePosition": n,           (numeric, optional, default=) The index of the change output
       "includeWatching": bool,       (boolean, optional, default=false) Also select inputs which are watch only
       "lockUnspents": bool,          (boolean, optional, default=false) Lock selected unspent outputs
       "feeRate": amount,             (numeric or string, optional, default=not set: makes wallet determine the fee) Set a specific fee rate in BCH/kB
       "subtractFeeFromOutputs": [    (json array, optional, default=empty array) A json array of integers.
                                      The fee will be equally deducted from the amount of each specified output.
                                      Those recipients will receive less bitcoins than you enter in their corresponding amount field.
                                      If no outputs are specified here, the sender pays the fee.
         vout_index,                  (numeric) The zero-based output index, before a change output is added.
         ...
       ],
     }

Result:
{
  "hex":       "value", (string)  The resulting raw transaction (hex-encoded string)
  "fee":       n,         (numeric) Fee in BCH the resulting transaction pays
  "changepos": n          (numeric) The position of the added change output, or -1
}

Examples:

Create a transaction with no inputs
> bitcoin-cli createrawtransaction "[]" "{\"myaddress\":0.01}"

Add sufficient unsigned inputs to meet the output value
> bitcoin-cli fundrawtransaction "rawtransactionhex"

Sign the transaction
> bitcoin-cli signrawtransactionwithwallet "fundedtransactionhex"

Send the transaction
> bitcoin-cli sendrawtransaction "signedtransactionhex"


