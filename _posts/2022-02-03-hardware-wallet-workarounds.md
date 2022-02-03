---
layout: post
title: Hardware Wallet Workarounds
multiLangId: 2022-02-03-hardware-wallet-workarounds
lang: en
---

A common question we've heard from the eCash community is how to safely store your eCash on popular hardware wallets.
Whilst the team is currently engaging with the major manufacturers to natively support eCash, there are a few workarounds that will allow you to use these devices now. These instructions are also available as a [video](https://youtu.be/N1htZtX4LGk).

Regardless of what type of hardware wallet you use, there are a few initial steps that are common to all brands.
Firstly you need to have installed the wallet itself. This includes making sure the firmware is updated and your PIN code is set up. Also, please take the time now to ensure that you've backed up your recovery seed phrase so you can recover your wallet at a later date. We cannot emphasize enough the importance of this step.

Once your hardware wallet has been set up, you'll need to connect it to the [Electrum ABC](/electrum/) wallet.

## Ledger Instructions

For Ledger users, you'll first need to install the Bitcoin Cash application onto your Ledger device if you haven't already. Follow these steps:
1. Open the Manager in Ledger Live
2. Connect and unlock your device
3. If asked, allow the Ledger Live manager on your device
4. Find the Bitcoin Cash app from the catalog
5. Click the Install button of the app.

![Ledger App catalog](/img/hardware-wallet-workarounds/Ledger-app-catalog.jpg "Bitcoin Cash App in Ledger App catalog")

Next, open your Electrum ABC wallet. In your Electrum ABC wallet, click on file, New and Restore, and then type the wallet name and click Next.

![Install Wizard - Create Ledger wallet](/img/hardware-wallet-workarounds/My-Ledger-wallet.jpg "Create Ledger wallet in Electrum ABC")

On the next screen, select 'Standard Wallet' for the wallet to be created and then click Next.

![Install Wizard - Select Standard wallet](/img/hardware-wallet-workarounds/Ledger-Standard-wallet.jpg "Select Standard wallet")

On the key store screen, select "Use a hardware device", but don't click Next just yet. Make sure your Ledger wallet is plugged into your computer if not already, and wait for a few seconds for your computer to recognize your device. Enter your pin directly on the Ledger device and then open ledger's Bitcoin Cash application. Once that's done, go back to the Electrum ABC wallet and click "Next".

![Install Wizard - Keystore](/img/hardware-wallet-workarounds/Keystore.jpg "Select Use a hardware device")

On the device screen, select the device that corresponds to your Ledger wallet then click Next.

![Install Wizard - Select a device](/img/hardware-wallet-workarounds/Ledger-device.jpg "Select your hardware device")

On the derivation path screen, ensure it is set to the BCH derivation path being m/44'/145'/0'. Then click Next.

![Install Wizard - Derivation Path](/img/hardware-wallet-workarounds/Derivation-path.jpg "Select the BCH derivation path")

You're now all set up to use your Ledger device with the Electrum ABC wallet.

## Trezor Instructions

For both "Trezor One" and "Trezor Model T" users, firstly open up your Electrum ABC wallet, click on file, New and Restore, and then type the wallet name and click Next.

![Install Wizard - Create Trezor wallet](/img/hardware-wallet-workarounds/My-Trezor-wallet.jpg "Create Trezor wallet in Electrum ABC")

On the next screen, select 'Standard Wallet' for the wallet to be created and then click Next.

![Install Wizard - Select Standard wallet](/img/hardware-wallet-workarounds/Trezor-Standard-wallet.jpg "Wallet Type - Select Standard wallet")

On the key store screen, select "Use a hardware device", but don't click Next just yet. Make sure your Trezor wallet is plugged into your computer if not already, and wait for a few seconds for your computer to recognize your device.

![Install Wizard - Keystore](/img/hardware-wallet-workarounds/Keystore.jpg "Select Use a hardware device")


### Trezor One

If you're using a Trezor One wallet, go back into Electrum ABC and click Next.
On the next screen select your Trezor One device, and click next.

![Install Wizard - Select a device](/img/hardware-wallet-workarounds/Trezor-device.jpg "Select your hardware device")

Then enter your pin in the dialog window opened by Electrum ABC and use your Trezor's display to locate the digits.

![Install Wizard - Trezor PIN](/img/hardware-wallet-workarounds/Trezor-PIN.jpg "Enter your Trezor PIN")

Then finally on the derivation path screen, ensure it is set to the BCH derivation path being m/44'/145'/0'. Click next and your Trezor One is now set up.

![Install Wizard - Derivation Path](/img/hardware-wallet-workarounds/Derivation-path.jpg "Select the BCH derivation path")

### Trezor Model T

If you're using a Trezor Model T wallet, back at the key store screen step, tap on your Trezor's screen and enter your pin directly on the Trezor Model T device. Then go back into the Electrum ABC wallet and click Next.

![trezor T PIN screen](/img/hardware-wallet-workarounds/Trezor-T-PIN.jpg "Enter PIN directly on Trezor T device")

On the final derivation path screen, ensure it is set to the BCH derivation path, which is also m/44'/145'/0'. Then click Next and you're now setup to use Trezor Model T devices as well.

![Install Wizard - Derivation Path](/img/hardware-wallet-workarounds/Derivation-path.jpg "Select the BCH derivation path")

## Moving your eCash to the hardware wallet

Now that you've set up your hardware wallet, getting the receiving address is as easy as clicking on the "Receive" tab of the Electrum ABC wallet. 
Sending XEC to this eCash address is essentially storing it in the hardware wallet you just set up.

![Receive tab](/img/hardware-wallet-workarounds/Receiving.jpg "Receive XEC into your hardware wallet")

When Sending eCash from this hardware wallet, it's the same as your usual Electrum ABC steps, but with the extra step where where you'll need to confirm the transaction on your hardware wallet.

![Send tab](/img/hardware-wallet-workarounds/Sending.jpg "Sending XEC from your hardware wallet")

Because this is a workaround, the confirmation value will show up on your device in BCH denomination, but ultimately it's the XEC that is being transferred.

![Confirmation Amount](/img/hardware-wallet-workarounds/Confirmation-amount.jpg "Confirmation amount in BCH denomination")

As always, please test with a small amount first just in case.

If you have any technical enquiries regarding the Electrum ABC wallet or its current workarounds with Trezor and Ledger devices please feel free to hop on to the official [Electrum ABC Telegram Group](https://t.me/ElectrumABC).

