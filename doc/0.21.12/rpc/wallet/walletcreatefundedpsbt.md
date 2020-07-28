---
name: walletcreatefundedpsbt
version: 0.21.12
group: wallet
permalink: doc/0.21.12/rpc/wallet/walletcreatefundedpsbt/
---

walletcreatefundedpsbt [{"txid":"hex","vout":n,"sequence":n},...] [{"address":amount},{"data":"hex"},...] ( locktime options bip32derivs )

Creates and funds a transaction in the Partially Signed Transaction format. Inputs will be added if supplied inputs are not enough
Implements the Creator and Updater roles.

Arguments:
1. inputs                             (json array, required) A json array of json objects
     [
       {                              (json object)
         "txid": "hex",               (string, required) The transaction id
         "vout": n,                   (numeric, required) The output number
         "sequence": n,               (numeric, required) The sequence number
       },
       ...
     ]
2. outputs                            (json array, required) a json array with outputs (key-value pairs).
                                      For compatibility reasons, a dictionary, which holds the key-value pairs directly, is also
                                      accepted as second parameter.
     [
       {                              (json object)
         "address": amount,           (numeric or string, required) A key-value pair. The key (string) is the bitcoin address, the value (float or string) is the amount in BCH
       },
       {                              (json object)
         "data": "hex",               (string, required) A key-value pair. The key must be "data", the value is hex-encoded data
       },
       ...
     ]
3. locktime                           (numeric, optional, default=0) Raw locktime. Non-0 value also locktime-activates inputs
                                      Allows this transaction to be replaced by a transaction with higher fees. If provided, it is an error if explicit sequence numbers are incompatible.
4. options                            (json object, optional)
     {
       "changeAddress": "hex",        (string, optional, default=pool address) The bitcoin address to receive the change
       "changePosition": n,           (numeric, optional, default=random) The index of the change output
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
5. bip32derivs                        (boolean, optional, default=false) If true, includes the BIP 32 derivation paths for public keys if we know them

Result:
{
  "psbt": "value",        (string)  The resulting raw transaction (base64-encoded string)
  "fee":       n,         (numeric) Fee in BCH the resulting transaction pays
  "changepos": n          (numeric) The position of the added change output, or -1
}

Examples:

Create a transaction with no inputs
> bitcoin-cli walletcreatefundedpsbt "[{\"txid\":\"myid\",\"vout\":0}]" "[{\"data\":\"00010203\"}]"


