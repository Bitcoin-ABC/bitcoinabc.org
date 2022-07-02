---
layout: post
title: How to Run Cash Fusion Remotely
subtitle: Using the Electrum ABC eCash Wallet in Daemon mode
multiLangId: 2022-07-01-running-cashfusion-remotely
lang: en
---

![Cash Fusion for eCash](/img/CashFusion-graphic.jpg "Cash Fusion for eCash")

The Electrum ABC eCash wallet contains the Cash Fusion feature. Cash Fusion provides basic opt-in anonymity for regular eCash (XEC) users. For example, if someone is paid in XEC, then goes to make a retail purchase, they may not want the retailer to be able to trivially see their salary payments. It's also important for businesses using eCash for payments, as they may not want their competitors to easily see all of their transactions with suppliers and customers.

The way Cash Fusion works is to automatically create transactions with other users of the protocol which combine many inputs and outputs from the different participating wallets. In this way, it becomes difficult or impossible to know which coins (outputs) correspond to the different inputs.

Some users of Cash Fusion like to leave it running continuously in order to keep a fresh supply of Fused coins, and also help provide liquidity to other Cash Fusion wallets on the network. In the past, this would typically mean running the Electrum ABC GUI application on your desktop computer, and just leaving the application going. But this is inconvenient and unreliable. With the release of [Electrum ABC 5.1.3](https://bitcoinabc.org/electrum/#5.1.3), it becomes possible to run Electrum ABC with Cash Fusion on daemon mode, making it convenient to leave it "always on", and easy to run on a remote server.

## Getting Electrum ABC up and running
 
You will be using the "AppImage" executable file to run Electrum ABC on a Linux terminal. This could either be on a remote server, or on your local machine. The first step is to download the Electrum ABC application in your Linux terminal:

```
wget https://github.com/Bitcoin-ABC/ElectrumABC/releases/download/5.1.3/ElectrumABC-5.1.3-x86_64.AppImage
chmod +x ElectrumABC-5.1.3-x86_64.AppImage
```

If you are unable to run AppImage, it may be because you are missing the "Filesystem in User Space" (FUSE) library. This is the case with Debian and Ubuntu. To fix this, run the following commands:

```
sudo apt-get install fuse libfuse2
sudo modprobe -v fuse
sudo addgroup fuse
sudo adduser $USER fuse
```

Now it's time to get the Electrum ABC daemon running, create a new wallet (save the seed), load it, generate addresses, and send funds to the addresses.

```
./ElectrumABC-5.1.3-x86_64.AppImage daemon start
./ElectrumABC-5.1.3-x86_64.AppImage create
./ElectrumABC-5.1.3-x86_64.AppImage daemon load_wallet
./ElectrumABC-5.1.3-x86_64.AppImage addrequest 0
./ElectrumABC-5.1.3-x86_64.AppImage addrequest 0
```

You may repeatedly use the `addrequest` command to generate fresh addresses to send coins to. For Cash Fusion, it is generally recommended to start with around least 5 to 10 coins of various amounts to get it going.

If you have a pre-existing wallet, it can be added with the following command. You can change the wallet path and name as needed.

```
./ElectrumABC-5.1.3-x86_64.AppImage -w ~/.electrum-abc/wallets/default_wallet daemon load_wallet
```

There are also help commands which provide lists of other commands available to Electrum ABC in daemon mode. Two useful help commands are:

```
./ElectrumABC-5.1.3-x86_64.AppImage help
./ElectrumABC-5.1.3-x86_64.AppImage daemon --help
```

## Enabling Cash Fusion

Next you will enable "autofuse". This tells the wallet to start automatically participating in Cash Fusion rounds as soon as the coins are confirmed.

```
./ElectrumABC-5.1.3-x86_64.AppImage daemon enable_autofuse 
```
 
If the wallet is password protected, specify the password as an extra argument after enable_autofuse:

```
./ElectrumABC-5.1.3-x86_64.AppImage daemon enable_autofuse  "my_password"
```
 
You are now running Cash Fusion!

The status of the Cash fusion can be checked with this command:

```
./ElectrumABC-5.1.3-x86_64.AppImage daemon fusion_status
```

When you want to stop Cash Fusion, you can stop the daemon with:

```
./ElectrumABC-5.1.3-x86_64.AppImage daemon stop
```

## Happy Fusing!

Congratulations, you are now able to run Electrum ABC as a command line daemon, and run Cash Fusion in this mode.
This daemon can be left running for extended periods of time to keep your wallet with a fresh supply of fused coins, and provide liquidity for other Cash Fusion users on the network.
