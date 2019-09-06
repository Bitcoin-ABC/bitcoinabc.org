---
layout: post
title: Prepárate para la actualización de Noviembre 2019 hoy con Bitcoin ABC 0.20.0
subtitle: La actualización de protocolo del 15 de Nov 2019 está ahora cerrada
multiLangId: 2019-08-21-bitcoin-abc-0-20-0
lang: es
---

El objetivo de Bitcoin ABC es ayudar a crear una moneda sólida que sea usada globalmente para impulsar la libertad y la prosperidad de todos. Bitcoin ABC continúa siendo una fuerza impulsora en la ejecución de [la hoja de ruta para Bitcoin Cash](https://www.bitcoincash.org/es/roadmap.html).

Alineados con esta visión, el equipo Bitcoin ABC se enorgullece en presentar la versión de actualización de protocolo de Noviembre 2019. Bitcoin ABC 0.20.0 ya está disponible y se puede descargar en: [https://download.bitcoinabc.org/0.20.0/](https://download.bitcoinabc.org/0.20.0/)

Las funcionalidades que se incluyen en cada actualización de protocolo se planifican, especifican [1] y desarrollan con mucha antelación para dar a todos los participantes del ecosistema Bitcoin Cash tiempo de preparación suficiente. De forma similar a la última actualización, la versión Bitcoin ABC 0.20.0 ha sido puesta a disposición tres meses antes de la activación, la que está programada para el 15 de Noviembre, 2019.
La actualización de protocolo, una vez activada, habilitará las siguientes funcionalidades:
* **Firmas Schnorr para OP_CHECKMULTISIG(VERIFY)** [2]. La actualización anterior permitió que las firmas Schnorr sean usadas con OP_CHECKSIG y OP_CHECKDATASIG, esta actualización extiende ese soporte a OP_CHECKMULTISIG. Luego de esta actualización, todas las operaciones de verificación de firmas soportarán firmas Schnorr.
* **Aplicar MINIMALDATA en script** [3]. Esto elimina el vector de maleabilidad final BIP 62 y significa que la mayoría de las transacciones en la red BCH (incluidas todas las P2PKH) ya no serán maleables.

Para ayudar con los preparativos técnicos de la actualización, hay un testnet disponible donde las funcionalidades pueden ser probadas [4]. Este testnet puede ser utilizado para garantizar la compatibilidad o para comenzar a crear productos que utilicen funcionalidades de la actualización.

Implementando optimizaciones y actualizaciones de protocolo, podemos hacer que el dinero digital par-a-par escale varios órdenes de magnitud más allá de los límites actuales. Bitcoin Cash debe mejorar continuamente para competir. En Bitcoin ABC estamos felices de trabajar en la construcción de la infraestructura necesaria para hacer que Bitcoin Cash sea la mejor moneda que el mundo haya visto jamás.

### Reference Links
[1] [November 2019 Protocol Upgrade Specification](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-upgrade.md)  
[2] [Specification for Schnorr Signatures in OP_CHECKMULTISIG(VERIFY)](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-schnorrmultisig.md)  
[3] [Specification for Enforcing MINIMALDATA in Script](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/spec/2019-11-15-minimaldata.md)  
[4] [Testnet Information](https://github.com/bitcoincashorg/bitcoincash.org/blob/master/workgroups/wg-testing/2019-11-15_upgrade_testnet.md)  
