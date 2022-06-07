---
layout: post
title: eCash (XEC) User Guide for D'CENT Hardware Wallets
multiLangId: 2022-06-10-ecash-user-guide-for-dcent-hardware-wallets
lang: en
---

Continuing our series of user guides for eCash compatible hardware wallets, we take a look at the [D'CENT biometric hardware wallet](https://dcentwallet.com/products/BiometricWallet) which natively supports the eCash blockchain.

The D'CENT wallet features a built-in fingerprint scanner that adds convenience and enhanced security for fast transaction signing. The seed phrase and private key for the wallet is also generated directly from the device without connecting to additional software.

This user guide will cover the steps to set up your D'CENT wallet and pairing it for use with your mobile phone via bluetooth. These instructions are also available as a [video](https://www.youtube.com/watch?v=t6qjjo3K8Xw).


## Biometric Device Setup

When you receive your D'CENT wallet there are a few steps to set up both the biometric wallet and your mobile device.

Starting with the biometric device, upon powering on the device you will be greeted with the option to select your preferred language. Use the arrow keys to cycle through the options and press the OK key on the right to confirm your choice.

![Select Language](/img/dcent-wallet/selectlanguage.png "Select Language" )


On the following screen, choose the Create Wallet option to generate a new cryptographic wallet and press OK.

![Create Wallet](/img/dcent-wallet/createwallet.png "Create Wallet" )

You will then be asked to enter your preferred PIN to secure this device. Use the up and down arrows to select a number and press ok to move onto the next digit. When you have entered 4 digits, you will see an 'OK' text on the screen. If you wish to set your PIN to 4-digits long, then press the OK button on the hardware wallet and it will prompt you to verify once more to confirm.

![Enter Pin](/img/dcent-wallet/enterpin.png "Enter Pin" )

The next step is to register your fingerprint via the biometric scanner. The fingerprint sensor is located in the middle of where the navigational buttons are located. You will need to slightly change the angular positioning of the same finger when scanning and need to repeat this until it displays 100%, which is typically 8 correct scans.

![Enrol Finger](/img/dcent-wallet/enrolfinger.png "Enrol Finger" )

And finally, your wallet will be generated with a 24 word mnemonic seed phrase provided on screen. 

**IMPORTANT**: Make sure to write down this seed phrase and keep it in a safe place. Failure to do so could result in the loss of all your coins if you lose access to this wallet.

![Recovery Seed](/img/dcent-wallet/recoveryseed.png "Recovery Seed" )

On the next screen, you will be asked to confirm the 24 words from the seed phrase. When you have selected the first character, press the "OK" button to enter the value. Repeat entering second and third characters.

![Enter Seed](/img/dcent-wallet/enterseed.png "Enter Seed" )

Then select the correct word that corresponds to the correct seed position. You will need to do this for all 24 words.

![Select Seed Word](/img/dcent-wallet/selectseedword.png "Select Seed Word" )

Once done, your new D'CENT biometric device is now ready for pairing with your mobile phone.

## Mobile App Setup

You will need to download the [Android](https://play.google.com/store/apps/details?id=com.kr.iotrust.dcent.wallet&utm_source=dcentwallet&utm_campaign=mobileapp) or [iOS](https://apps.apple.com/us/app/dcent-wallet/id1447206611) D'CENT app compatible with your mobile device.

Once you have installed the mobile app, open it and select the Biometric Wallet option on the welcome screen. This will be followed by a request to register a 6 digit password for the app.

![Biometric Splash](/img/dcent-wallet/biometricsplash.png "Biometric Splash" )

You will then be taken to the home screen and the mobile app will request your permission to use bluetooth to communicate with the biometric device. Please ensure you allow this.

![Biometric Bluetooth](/img/dcent-wallet/biometricbluetooth.png "Biometric Bluetooth" )

Once you have granted bluetooth permission, click on the bluetooth icon on the top right, which will open a dialogue to scan for nearby biometric devices and select the appropriate wallet to start the bluetooth pairing process.

![Biometric Pairing](/img/dcent-wallet/biometricpairing.png "Biometric Pairing" )

Once the device is paired, you will be taken to the home screen. Click on the plus icon on the bottom right to add a new eCash wallet and then search for the eCash XEC blockchain. Please check you're adding "eCash (XEC)" as there are other token derivatives of eCash in other blockchains that come with custodial risks.

![Biometric Add Wallet](/img/dcent-wallet/biometricaddwallet.png "Biometric Add Wallet" ) 
![Biometric Select XEC](/img/dcent-wallet/biometricselectxec.png "Biometric Select XEC" )

On the following screen, choose a name for your new eCash wallet based on the naming requirements on screen and then press the Create button. Then wait for the wallet to synchronize with the XEC blockchain. This will take a few seconds depending on the speed of your internet connection.

![Biometric Wallet Name](/img/dcent-wallet/biometricwalletname.png "Biometric Wallet Name" )

Once your wallet creation is complete, you can then click on the new wallet to show a number of actions. Select the Receive option to display the receiving address of this new eCash wallet. You can click on the copy button below the QR code to copy this address, or scan the QR code displayed.

![Biometric Receive](/img/dcent-wallet/biometricreceive.png "Biometric Receive" ) 
![Biometric Address](/img/dcent-wallet/biometricaddress.png "Biometric Address" )

Clicking on the Send option will take you to the Sending screen where you can either paste in another eCash address via your clipboard, or scan another eCash wallet's QR code. For this example let's paste in an eCash address copied from clipboard and click Next.

![Biometric Send](/img/dcent-wallet/biometricsend.png "Biometric Send" ) 
![Biometric Destination](/img/dcent-wallet/biometricdestination.png "Biometric Destination" )

On the next screen, you can specify the amount to send based on XEC or your choice of fiat denomination. You can also adjust the transaction fee, but we suggest leaving it to the default value for now, and click Next.

![Biometric Amount](/img/dcent-wallet/biometricamount.png "Biometric Amount" )

On the following screen, you will be shown a summary of the transaction. Please check the recipient address, network fee and total XECs being sent. Click Send when you are ready to progress.

![Biometric Summary](/img/dcent-wallet/biometricsummary.png "Biometric Summary" )

Upon confirming the transaction within the mobile app, your D'CENT biometric device will now display the same transaction summary for you to double check. When ready, press the OK button on the biometric device.

![Biometric Confirmation](/img/dcent-wallet/biometricconfirmation.png "Biometric Confirmation" )

The device will then ask for your fingerprint to authorize this transaction. If your fingerprint matches what was registered with the biometric device, then the transaction will be broadcasted onto the XEC blockchain.

![Biometric Authentication](/img/dcent-wallet/biometricauthentication.png "Biometric Authentication" )

So in summary, this biometric wallet provides the extra security in the form of a fingerprint scanner, works in tandem with your mobile device, whilst natively supporting the eCash blockchain. If you have any questions regarding using this wallet for eCash purposes, please hop onto the [Official eCash telegram channel](https://t.me/ecash_official).

