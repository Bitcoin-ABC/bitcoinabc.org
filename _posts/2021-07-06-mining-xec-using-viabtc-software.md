---
layout: post
title: Mining eCash using ViaBTC Mining Pool Software
multiLangId: 2021-07-06-mining-xec-using-viabtc-software
lang: en
---

This is a quick guide for mining pool operators to setup a new mining pool to mine eCash (XEC) using viabtc_mining_server which was open sourced by ViaBTC a few months ago. Let’s begin!

To start, deploy an eCash full node. This guide will assume you have one running on the local machine at 127.0.0.1:18332 (we use testnet in this example).

## Build the ViaBTC Mining Server

As of this writing, the following instructions can be run on Debian 10 (Buster):

```
git clone https://github.com/viabtc/viabtc_mining_server.git
cd viabtc_mining_server
for DIR in network utils jobmaster gateway mineragent ; do pushd "${DIR}" ; make ; popd ; done
```

Note: In this guide, we only build the minimal necessary pieces of the pool software in order to get a pool up and running. If you desire additional logging, improved peering, and other advanced features, we encourage you to look at the other modules provided in the repository.

## Create a logging directory

```
sudo mkdir -p /var/log/pool
sudo chown $(whoami):$(whoami) /var/log/pool/
```

## Set up the config files

### gateway/config.json

The defaults only work for some networks. Try the following configuration:

```
"diff_min": 1000,
"diff_max": 100000000,
"diff_default": 500000,
```

### jobmaster/config.json

Configure the "main_coin" option:

```
"main_coin" : {
  "name": "XEC",
  "host": "[your_ecash_node_host]",
  "port": "[your_ecash_node_port]",
  "user": "[your_ecash_node_username]",
  "pass": "[your_ecash_node_password]",
}
```

Remove the following options, if present: "aux_coin", "rsk_coin" and "vcash_coin"

You can add as many entries to "coin_recipients" as you like. For mainnet, it must contain the miner fund address (with a minimum 8 percent), as below:

```
{
  "address": "3LyFQTKbPwXtgrsGpMbbEECY7ViBeFbonU",
  "percent": 0.08
}
```

For **testnet**, your eCash node must be configured with -enableminerfund=1, and the following "address" instead:

```
{
  "address": "2NCXTUCFd1Q3EteVpVVDTrBBoKqvMPAoeEn",
  "percent": 0.08
}
```

"pool_name" and "coinbase_message": The name of your mining pool and an optional message to include in each block.

Add the following option to the end of the config file: "segwit_commitment": false

### mineragent/config.json

"stratum_port": Make sure this port matches the stratum port that your miners will be using. Common port numbers include 3222 and 3333.

### For all config files

The applications may fail to run with the default configs unless you configure the kernel to use increased file and core limit sizes. For testing purposes, you can simply remove `file_limit` and `core_limit` config lines.

## Run the pool applications

```
for APP in jobmaster gateway mineragent ; do pushd “${APP}” ; ./”${APP}.exe” config.json ; popd ; done
```

Congratulations, your mining pool is now fully operational.

## Use your pool to mine eCash blocks

Configure your miners to point at [your_pool_ip]:[your_stratum_port]. You can observe the logs at /var/log/pool to ensure the pool is working properly, and watch the blocks roll in!

