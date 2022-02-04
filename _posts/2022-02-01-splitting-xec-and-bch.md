---
layout: post
title: Splitting eCash and BCH coins using Electrum ABC and Electron Cash
multiLangId: 2022-02-01-splitting-ecash-and-bch
lang: en
---

![Splitting XEC and BCH coins](/img/splitting.jpg "Splitting XEC and BCH coins")

eCash and Bitcoin Cash share a common history, and became separate currencies via a [blockchain split](https://en.wikipedia.org/wiki/Fork_(blockchain)) on November 15th, 2020. Because of this, and the fact the both currencies have the same transaction format, it is possible for [transaction replay](https://bitcoin.stackexchange.com/questions/61212/what-is-transaction-replay-and-replay-protection) to occur when someone sends coins on either chain.

This article explains a method to split BCH and eCash from each other using [Electrum ABC](/electrum/) and [Electron Cash](https://electroncash.org/) wallets. This allows you to split coins while keeping them under your own control. 

**Warning:** There are scammers and thieves who create fake coin splitting tools and services to steal people's coins. Never send your coins, or enter your private key or recovery words into any site or software unless you are certain that it can be trusted. The scammers create fake social media profiles and Youtube channels, so always double check sources and be careful following any links. Always be very cautious, and ask for help if you are unsure.

## What is Transaction Replay

Transaction Replay affects coins that have not been moved since before the blockchain split. This means that if you have Bitcoin Cash coins that have not moved since before Nov 15th, 2020, you will also have eCash (XEC). If you create a transaction to spend the BCH, or the XEC, the same transaction will be valid on both networks. This means that both the BCH and XEC will be spent, and sent to the same destination address. If the recipient is not expecting coins on both networks, then either the BCH or XEC may be lost. In order to avoid this problem, you should "split" the coins before sending to anyone.

## How coin splitting works

It is important to understand the principle behind splitting your coins. The goal is to create two different transactions, one on Bitcoin Cash and one on eCash, that will confirm on each blockchain separately. Because Electron Cash and Electrum ABC wallets use a block-height-based locktime on transactions, and the BCH and eCash blockchains are at very different heights, BCH coins sent using Electron Cash cannot be replayed on the eCash network for several days. This makes it easy to split coins by sending two separate transactions on the two networks.

You should be aware that there are also other methods to split coins. But in all cases the goal is that same: create two different transactions on the two networks. One other method is to use “split dust”, and mixing these already-split coins with the one you are spending. A third method is to send the unsplit coins to a service that will split for you. Some exchanges can do this, but it requires trusting that exchange.

## How to split your coins

These are the steps to split XEC from BCH using Electron Cash and Electrum ABC.

**Note:** These instructions work if you are holding unsplit BCH/XEC in a wallet that you control. If the coins are on an exchange, you will not be able to access the unsplit coins, and you will have to rely on the exchange to split the coins for you.

### Step one: Get your unsplit coins into Electron Cash and Electrum ABC
Depending on where your BCH/XEC coins are held, there are different ways to get your unsplit coins into Electron Cash and Electrum ABC wallets.
* If you don’t already have Electron Cash, you can install it from [here](https://electroncash.org/).
* The best method is to import other wallets into Electron Cash by importing your "passphrase". This is the 12 words you should have written down to back up the wallet. Import that wallet to Electron Cash by selecting “File” then “New/Restore” and following those steps.
* If you can't restore the wallet from the passphrase, you can try sending the BCH coins to a new Electron Cash wallet. In Electron Cash, go to "File" then "New/Restore", and make a new wallet. If you do this, make sure you write down the 12-word passphrase, you will need them for Electrum ABC. If you use this method, there's a chance your coins won't replay on the eCash network. The transaction can be broadcast manually, but this is more complicated, and therefore it is recommended you use the method where you import the passphrase into Electron Cash directly.
* After the coins are in Electron Cash, you should confirm that the XEC side is now in Electrum ABC. If you do not already have Electrum ABC installed, you can get it [here](https://www.bitcoinabc.org/electrum/). Upon installation, Electrum ABC will copy existing Electron Cash wallets for you.
* If the wallet wasn't copied automatically, follow that same method you used above to create the same wallet in Electrum ABC. Confirm that you have the XEC side of the unsplit coins in this wallet.

### Step two: Send BCH to yourself in Electron Cash
* Now that you have your BCH coins in an Electron Cash wallet, open that wallet.
* To split all the coins in your wallet, go to the “Send” tab and click “Max” after the amount. Alternatively, you can split individual coins from “Addresses” by right-clicking the address you want to split and selecting “Spend from”, and then clicking the “Max” button.
* Go to the “Receive” tab and copy the receiving address.
* Go back to the “Send” tab and paste the address into the “Pay to” field.
* Click on the “Preview” button, and make sure that the address in the “Output” box is colored green. The green address indicates that you are sending the coins to yourself in the same wallet. You can also check that the “Input” coins are the coins that you want to split.
* If everything looks okay, click “Sign” and then “Broadcast”.

### Step three: Send coins to yourself in Electrum ABC
* In Electrum ABC, select the same coin or coins that were split in step one above, and begin a transaction in the “Send” tab.
* Go to the “Address” tab. Right-click and copy the second unused address from the “Receiving” list. Make sure that this address is different than the one used in step one above.
* Go back to the Send tab and paste this different receiving address in the “Pay to” field.
* Click on the “Preview” button to inspect the transaction. Again, check that the “Output” address is green, meaning that you are sending to yourself. Also check that the “Input” addresses are the same, and the “Output” address is different than the ones used when sending coins on the BCH network in Step one.
* If everything looks okay, click “Sign” and then “Broadcast”.

### Step four: block explorers
* Wait for confirmations, and check block explorers for both chains. In both Electron Cash and Electrum ABC, this can be done from the “History” tab by right-clicking on the transaction, and choosing “View on block explorer”. 
* Make sure that the coins have gone to different addresses on either chain. When you have confirmations on both chains, you have successfully split your coins. Congratulations!

For more information see [e.cash](https://e.cash).

For direct support, please contact us at: [support@bitcoinabc.org](mailto:support@bitcoinabc.org).
